#encoding: UTF-8
require 'rails_helper'

RSpec.describe "Workers", :type => :request do
     subject { page }

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

      end

      describe "page" do
          
            it{ page.should have_content('تحديث الملف الشخصي للعامل')}
            it{ page.should have_button('save')}
        end

    describe "with invalid info" do
      before { click_button 'save'}
      specify { response.should redirect_to(@jobs)}
             it "should have title" do
        expect(page).to have_content('بيانات المهنه')
         end
       end

    end

    describe "with valid info" do
      let(:new_name) {"New Name"}
      let(:new_image) {"New Image"}

      
    
        before do
            fill_in "Name",   with: new_name
            fill_in "Image",   with: new_image

            click_button 'save_button'
        end
    

    end
  end

     describe "create" do

      before do
        visit new_job_path(@job)
                page.should have_content('اسم_المهنه')

      end

      describe "page" do
          
            it{ page.should have_content('إضافة مهنه')}
            it{ page.should have_button('save_job')}
        end

    describe "with invalid info" do
      before { click_button 'save_job'}
       specify { response.should redirect_to(@jobs)}
       it "should have title" do
        expect(page).to have_content('بيانات المهنه')
         end
       end

    end

    describe "with valid info" do
      let(:new_name) {"New Name"}
      let(:new_image) {"New Image"}

      
    
        before do
            fill_in "Name",   with: new_name
            fill_in "Image",   with: new_image

            click_button 'save_job'
        end
    

    end
  end

       describe "update" do

      before do
        visit edit_job_path(@job)
                page.should have_content('اسم_المهنه')

      end

      describe "page" do
              it{ page.should have_content('إضافة مهنه')}
              it{ page.should have_button('save_button')}
        end

    describe "with invalid info" do
         before { click_button 'save_button'}
             specify { response.should redirect_to(@jobs)}
             it "should have title" do
             expect(page).to have_content('بيانات المهنه')
              end
            end

    end

    describe "with valid info" do
      let(:new_name) {"New Name"}
      let(:new_image) {"New Image"}

      
    
        before do
            fill_in "Name",   with: new_name
            fill_in "Image",   with: new_image

            click_button 'save_job'
        end
    

    end



  
