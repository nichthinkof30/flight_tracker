require 'rails_helper'

RSpec.describe "records/new", :type => :view do
  before(:each) do
    assign(:record, Record.new(
      :lowest => 1,
      :highest => 1,
      :tracker_id => 1
    ))
  end

  it "renders new record form" do
    render

    assert_select "form[action=?][method=?]", records_path, "post" do

      assert_select "input#record_lowest[name=?]", "record[lowest]"

      assert_select "input#record_highest[name=?]", "record[highest]"

      assert_select "input#record_tracker_id[name=?]", "record[tracker_id]"
    end
  end
end
