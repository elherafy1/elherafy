require 'rails_helper'

RSpec.describe "workers/index", :type => :view do
  before(:each) do
    assign(:workers, [
      Worker.create!(
        :name => "Name",
        :area => "Area",
        :status => "Status"
      ),
      Worker.create!(
        :name => "Name",
        :area => "Area",
        :status => "Status"
      )
    ])
  end

  it "renders a list of workers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Area".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
