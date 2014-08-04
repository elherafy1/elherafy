require 'rails_helper'

RSpec.describe "workers/show", :type => :view do
  before(:each) do
    @worker = assign(:worker, Worker.create!(
      :name => "Name",
      :area => "Area",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Area/)
    expect(rendered).to match(/Status/)
  end
end
