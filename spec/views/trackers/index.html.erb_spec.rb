require 'rails_helper'

RSpec.describe "trackers/index", :type => :view do
  before(:each) do
    assign(:trackers, [
      Tracker.create!(
        :origin => "Origin",
        :destination => "Destination",
        :from_date => "From Date",
        :to_date => "To Date",
        :user_id => 1
      ),
      Tracker.create!(
        :origin => "Origin",
        :destination => "Destination",
        :from_date => "From Date",
        :to_date => "To Date",
        :user_id => 1
      )
    ])
  end

  it "renders a list of trackers" do
    render
    assert_select "tr>td", :text => "Origin".to_s, :count => 2
    assert_select "tr>td", :text => "Destination".to_s, :count => 2
    assert_select "tr>td", :text => "From Date".to_s, :count => 2
    assert_select "tr>td", :text => "To Date".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
