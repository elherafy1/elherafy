require 'rails_helper'

RSpec.describe "workers/edit", :type => :view do
  before(:each) do
    @worker = assign(:worker, Worker.create!(
      :name => "MyString",
      :area => "MyString",
      :status => "MyString"
    ))
  end

  it "renders the edit worker form" do
    render

    assert_select "form[action=?][method=?]", worker_path(@worker), "post" do

      assert_select "input#worker_name[name=?]", "worker[name]"

      assert_select "input#worker_area[name=?]", "worker[area]"

      assert_select "input#worker_status[name=?]", "worker[status]"
    end
  end
end
