require 'rails_helper'

RSpec.describe "Workers", :type => :request do

	before do
		@review= FactoryGirl.create(:review)
		@worker = FactoryGirl.build(:worker)
		@worker.reviews<<@review
		@worker.save
	end	
    describe "GET /workers" do
        describe "Workers page" do
         	it "workers" do
                visit workers_path
  		      	page.should have_content ('Listing workers')
  		    	expect(page).to have_title('Workers')
  		    	page.should have_selector('h1','Listing workers')
  		    	should have_link('New Worker', href:new_worker_path)
  			end
  		end	

  		describe "Workers page" do
         	it "do new worker" do
                visit new_worker_path
  		      	page.should have_content ('New worker')
  		    	expect(page).to have_title('Add Worker')
  		    	page.should have_selector('h1','New worker')
  			end
  		end	

    describe "edit" do

     
        before do
          visit edit_worker_path(@worker)
        end

        describe "page" do
        	
            it{ page.should have_selector('h1','Editing worker')}
            it{ expect(page).to have_title('Edit Worker')} 
        end

    describe "with invalid info" do
      before { click_button "Update Worker"}

    end

    describe "with valid info" do
      let(:new_name) {"New Name"}
      let(:new_area) {"New Area"}
      let(:new_status) {"New Status"}
      let(:new_kind) {"New Kind"}
      
    
        before do
            fill_in "Name",   with: new_name
            fill_in "Area",   with: new_area
            fill_in "status",   with: new_status
            fill_in "Kind",   with: new_kind
            click_button "Update Worker"
        end
    

    end
  end

    end
  
end
