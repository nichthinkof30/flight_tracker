class UsersController < ApplicationController

  def create
    found = User.find_by_email(params[:email])
    if found.present?
      redirect_to root_path, alert: "Sorry, the service now only support 1 tracker per email."
    else
      new_user = User.new(email: params[:email])

      if new_user.save
        tracker = Tracker.new
        tracker.origin = params[:origin]
        tracker.destination = params[:destination]
        tracker.from_date = params[:from]
        tracker.to_date = params[:to]
        tracker.target = params[:target]
        new_user.trackers << tracker

        if new_user.save
          # ScrapingJob.new.async.perform(tracker.id)
          redirect_to root_path, notice: "You will be notify when price is lower than your target. Thanks for supporting the service :)"
        end
      end
    end
  end
end