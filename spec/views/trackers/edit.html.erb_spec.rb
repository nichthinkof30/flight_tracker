require 'rails_helper'

RSpec.describe "trackers/edit", :type => :view do
  before(:each) do
    @tracker = assign(:tracker, Tracker.create!(
      :origin => "MyString",
      :destination => "MyString",
      :from_date => "MyString",
      :to_date => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit tracker form" do
    render

    assert_select "form[action=?][method=?]", tracker_path(@tracker), "post" do

      assert_select "input#tracker_origin[name=?]", "tracker[origin]"

      assert_select "input#tracker_destination[name=?]", "tracker[destination]"

      assert_select "input#tracker_from_date[name=?]", "tracker[from_date]"

      assert_select "input#tracker_to_date[name=?]", "tracker[to_date]"

      assert_select "input#tracker_user_id[name=?]", "tracker[user_id]"
    end
  end
end
