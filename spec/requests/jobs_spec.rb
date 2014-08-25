#encoding: UTF-8
require 'rails_helper'

RSpec.describe "Jobs", :type => :request do
  subject { page }
   describe "jobs" do

let!(:admin) {FactoryGirl.create(:admin) }
let!(:job) {FactoryGirl.create(:job) }
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


  describe "GET /jobs" do
    describe "jobs page" do
      it "jobs" do
        visit jobs_path
        page.should have_content ('المهنه')
        #expect(page).to have_title('Workers')
        page.should have_selector('h1','المهنه')
        
      end
    end 

    describe "Jobs page" do
      it "do new job" do
        visit new_job_path
        page.should have_content('إضافة مهنه')
        #expect(page).to have_title('اضافة عامل')
        page.should have_selector('h1','إضافة مهنه')
      end
    end 
    
    describe "edit" do
let!(:job) {FactoryGirl.create(:job) }
      before do
        visit edit_job_path(job)
                page.should have_content('تحديث بيانات المهنه')

      end

      describe "page" do
          
            it{ page.should have_content('الاسم')}
            it{ page.should have_button('save_button')}
        end

    describe "with invalid info" do
      before { click_button 'save_button'}
     # specify { response.should redirect_to(@jobs)}
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
                page.should have_content('إضافة مهنه')

      end

      describe "page" do
          
            it{ page.should have_content('إضافة مهنه')}
            it{ page.should have_button('save_job')}
        end

    describe "with invalid info" do
      before { click_button 'save_job'}
       #specify { response.should redirect_to(@jobs)}
       it "should have title" do
        expect(page).to have_content('إضافة مهنه')
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
        let!(:admin) {FactoryGirl.create(:admin) }
let!(:job) {FactoryGirl.create(:job) }
      before do
         sign_in admin
        visit edit_job_path(job)
        page.should have_content('الاسم')

      end

      describe "page" do
              it{ page.should have_content('اضافة مهنه')}
              it{ page.should have_button('save_button')}
        end

    describe "with invalid info" do
         before { click_button 'save_button'}
             #specify { response.should redirect_to(@jobs)}
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

    
  