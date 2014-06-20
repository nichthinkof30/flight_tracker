require 'rails_helper'

RSpec.describe "records/edit", :type => :view do
  before(:each) do
    @record = assign(:record, Record.create!(
      :lowest => 1,
      :highest => 1,
      :tracker_id => 1
    ))
  end

  it "renders the edit record form" do
    render

    assert_select "form[action=?][method=?]", record_path(@record), "post" do

      assert_select "input#record_lowest[name=?]", "record[lowest]"

      assert_select "input#record_highest[name=?]", "record[highest]"

      assert_select "input#record_tracker_id[name=?]", "record[tracker_id]"
    end
  end
end
