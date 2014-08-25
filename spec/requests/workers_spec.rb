#encoding: UTF-8
require 'rails_helper'

RSpec.describe "Workers", :type => :request do
let!(:admin) {FactoryGirl.create(:admin) }
	before do
		@review= FactoryGirl.create(:review)
    @review1= FactoryGirl.create(:review)
    @review2= FactoryGirl.create(:review)
    @review3= FactoryGirl.create(:review)
		@worker = FactoryGirl.build(:worker)
    @mabalat = FactoryGirl.build(:mabalat)
    @naggar = FactoryGirl.build(:naggar)
    @sabak = FactoryGirl.build(:sabak)
		@worker.reviews<<@review
		@worker.save
          @mabalat.reviews<<@review1
          @mabalat.save
          @naggar.reviews<<@review2
          @naggar.save
          @sabak.reviews<<@review3
          @sabak.save

     sign_in admin
  end	
  describe "GET /workers" do
    describe "Workers page" do
      it "workers" do
        visit workers_path
  		 	page.should have_content ('قائمة العمال')
  		  #expect(page).to have_title('Workers')
  		  page.should have_selector('h1','قائمة العمال')
  		  
  		end
  	end	

  	describe "Workers page" do
      it "do new worker" do
        visit new_worker_path
  		  page.should have_content('اضافة عامل')
  		  #expect(page).to have_title('اضافة عامل')
  		  page.should have_selector('h1','اضافة عامل')
  		end
  	end	
    
    describe "edit" do
      

      before do
        visit edit_worker_path(@worker)
         page.should have_content('تحديث الملف الشخصي للعامل')
         page.should have_selector('h1','تحديث الملف الشخصي للعامل')
      end

      describe "page" do
        	
            it{ page.should have_selector('h1','Update Worker Profile')}
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

      describe "create" do
      

      before do
        visit new_worker_path(@worker)
         page.should have_content('إضافة عامل')
         page.should have_selector('h1','إضافة عامل')
      end

      describe "page" do
          
            #it{ page.should have_selector('h1','Update Worker Profile')}
            #it{ expect(page).to have_title('Edit Worker')} 
        end

    describe "with invalid info" do
      before { click_button 'save_worker'}

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
            click_button 'save_worker'
        end
    

    end
  end

    end
  
end
