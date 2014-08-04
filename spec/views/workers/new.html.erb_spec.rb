require 'rails_helper'

RSpec.describe "workers/new", :type => :view do
  before(:each) do
    assign(:worker, Worker.new(
      :name => "MyString",
      :area => "MyString",
      :status => "MyString"
    ))
  end

  it "renders new worker form" do
    render

    assert_select "form[action=?][method=?]", workers_path, "post" do

      assert_select "input#worker_name[name=?]", "worker[name]"

      assert_select "input#worker_area[name=?]", "worker[area]"

      assert_select "input#worker_status[name=?]", "worker[status]"
    end
  end
end
