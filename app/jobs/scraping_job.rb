class ScrapingJob
  # include SuckerPunch::Job

  def perform
    if Rails.env.production?
      headless = Headless.new
      headless.start
    end
    # ActiveRecord::Base.connection_pool.with_connection do
    # track = Tracker.find(id)
    Tracker.all.each do |track|
      begin
        b = Watir::Browser.new
        b.goto 'http://booking.airasia.com/Search.aspx'
        sleep(3)
        origin_name = Tracker::LOCATION_FROM.find(track.origin).first[0]
        b.text_field(id: "ControlGroupSearchView_AvailabilitySearchInputSearchVieworiginStationMultiColumn1_1").set("#{origin_name}")
        sleep(3)
        b.a(data_value: "#{track.origin}").click

        destination_name = Tracker::LOCATION_TO.find(track.destination).first[0]
        b.text_field(id: "ControlGroupSearchView_AvailabilitySearchInputSearchViewdestinationStationMultiColumn1_1").set("#{destination_name}")
        sleep(3)
        b.a(data_value: "#{track.destination}").click

        b.text_field(id: "ControlGroupSearchView_AvailabilitySearchInputSearchViewdate_picker_display_id_1").set("#{track.from_date}")
        sleep(3)
        b.send_keys :tab

        b.text_field(id: "ControlGroupSearchView_AvailabilitySearchInputSearchViewdate_picker_display_id_2").set("#{track.to_date}")
        sleep(3)
        b.send_keys :tab
        sleep(3)

        b.button(id: "ControlGroupSearchView_ButtonSubmit").click

        while !b.divs(id: "price").present? do sleep 1 end

        new_record = Record.new
        if b.span(class: "total-value bold black5").present?
          total_price = b.span(class: "total-value bold black5").text
        end

        if total_price.present?
          new_record.lowest = total_price.to_i
        end

        price_lists = b.divs(class: "price").to_a.map(&:text)
        separate = price_lists.each_slice(price_lists.size/2).to_a
        from_prices = separate[0]
        to_prices = separate[1]

        #GET THE FIRST OF BOTH 2 ARRAY WHICH IS CHEAPEST
        low_from_price = from_prices[0].delete(" MYR").to_i
        low_to_price = to_prices[0].delete(" MYR").to_i
        if low_from_price.present? and low_to_price.present?
          new_record.lowest = low_from_price + low_to_price
        end

        #CHECK FOR HIGHEST VALUE
        high_from_price = from_prices[2].delete(" MYR").to_i
        high_to_price = to_prices[2].delete(" MYR").to_i
        if high_from_price.present? and high_to_price.present?
          new_record.highest = high_from_price + high_to_price
        end

        track.records << new_record
        track.save

        if new_record.lowest <= track.target
          Notify.send_notify(track.user, track, new_record).deliver
        end

        b.close
        sleep(5)
      rescue Exception => ex
        puts "Errors occured"
        puts ex
        b.close
      end
    end
    # end
    headless.destroy if Rails.env.production?
  end


end