require 'rails_helper'

RSpec.describe "trackers/new", :type => :view do
  before(:each) do
    assign(:tracker, Tracker.new(
      :origin => "MyString",
      :destination => "MyString",
      :from_date => "MyString",
      :to_date => "MyString",
      :user_id => 1
    ))
  end

  it "renders new tracker form" do
    render

    assert_select "form[action=?][method=?]", trackers_path, "post" do

      assert_select "input#tracker_origin[name=?]", "tracker[origin]"

      assert_select "input#tracker_destination[name=?]", "tracker[destination]"

      assert_select "input#tracker_from_date[name=?]", "tracker[from_date]"

      assert_select "input#tracker_to_date[name=?]", "tracker[to_date]"

      assert_select "input#tracker_user_id[name=?]", "tracker[user_id]"
    end
  end
end
