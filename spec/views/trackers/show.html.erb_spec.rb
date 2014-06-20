require 'rails_helper'

RSpec.describe "trackers/show", :type => :view do
  before(:each) do
    @tracker = assign(:tracker, Tracker.create!(
      :origin => "Origin",
      :destination => "Destination",
      :from_date => "From Date",
      :to_date => "To Date",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Origin/)
    expect(rendered).to match(/Destination/)
    expect(rendered).to match(/From Date/)
    expect(rendered).to match(/To Date/)
    expect(rendered).to match(/1/)
  end
end
