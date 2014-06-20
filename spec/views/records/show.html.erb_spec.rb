require 'rails_helper'

RSpec.describe "records/show", :type => :view do
  before(:each) do
    @record = assign(:record, Record.create!(
      :lowest => 1,
      :highest => 2,
      :tracker_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
