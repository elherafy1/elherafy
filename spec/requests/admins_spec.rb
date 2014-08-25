#encoding: UTF-8
require 'rails_helper'

RSpec.describe "Admins", :type => :request do
 
	subject{page}

	before do
		@review= FactoryGirl.create(:review)
		@worker=FactoryGirl.build(:worker)
		@worker.reviews<<@review
		@worker.save
	end
	describe "edit" do
		let(:admin) { FactoryGirl.create(:admin) }


		#let (:worker) { FactoryGirl.create(:worker) }
		before do
			sign_in admin
			 visit edit_worker_path(@worker) 
			end



		describe "page" do

			  	it "should have edit title" do
  		expect(page).to have_title("Edit Worker")
  	end
		end
		describe "with invalid info" do
		  before { 
		    fill_in 'worker_name', with: ""
		  	click_button "save" }
		  it { should have_content('error') }

		end

		describe "with valid info" do
			let(:new_name) { "New Name" }
			let(:new_area) { "New Area" }
			let(:new_status) { "مشغول"}
			before do
				fill_in 'worker_name', with: new_name
				fill_in 'worker_area', with: new_area
				select 'مشغول', from:'worker_status'

			    click_button "save"
			end

  	it { should have_link('sign_out', href: destroy_admin_session_path) }
  	it { should have_selector('div.alert.alert-success') }
  	specify { @worker.reload.name.should == new_name }
  	specify { @worker.reload.area.should == new_area }
  	specify { @worker.reload.status.should == new_status }
		end

	end
end