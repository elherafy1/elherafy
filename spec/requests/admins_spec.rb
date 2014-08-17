	require 'rails_helper'

RSpec.describe "Admins", :type => :request do
 
	subject{page}
	describe "edit" do
		let(:admin) { FactoryGirl.create(:admin) }
		let (:worker) { FactoryGirl.create(:worker) }
		before do
			sign_in admin
			 visit edit_worker_path(worker) 
			end



		describe "page" do

			  	it "should have edit title" do
  		expect(page).to have_title("Edit Worker")
  	end
		end
		describe "with invalid info" do
		  before { 
		    fill_in "Name", with: ""
		  	click_button "Save changes" }
		  it { should have_content('error') }

		end

		describe "with valid info" do
			let(:new_name) { "New Name" }
			let(:new_area) { "New Area" }
			let(:new_status) { "New Status"}
			before do
				fill_in "Name", with: new_name
				fill_in "Area", with: new_area
				fill_in "Status", with: new_status
			    click_button "Save changes"
			end

  	it { should have_link('Sign out', href: signout_path) }
  	it { should have_selector('div.alert.alert-success') }
  	specify { worker.reload.name.should == new_name }
  	specify { worker.reload.area.should == new_area }
  	specify { worker.reload.status.should == new_status }
		end

	end
end