require 'rails_helper'

RSpec.describe "AuthenticationPages", :type => :request do

	subject { page }
  describe "GET /authentication_pages" do

    describe "sign in" do
      before { visit root_path }
      describe "with valid info" do
    		before { 
    			visit new_admin_session_path
    		  click_button 'Sign in'
    		}
    		#invalid sign in
    		#before{ sign_in }
  			it { should have_selector('div.alert.alert-danger', text: 'Invalid') }
   			describe "after visiting anothe page" do
	  			before { click_link "Home" }
	  			it { should_not have_selector('div.alert.alert-danger') }
   			end
      end
      describe "with invalid info" do
      end
      describe "with valid info" do
        let(:admin) { FactoryGirl.create(:admin) }
        before { sign_in admin }
        # it { should have_link('Sign out', href: signout_path) }
        # it { should have_link('Workers',  href: workers_path) }
        # it { should_not have_link('Sign in as admin', href: signin_path) }
        describe "follow by signout" do
    	    before { click_link "Sign out" }
          #it {should have_css("form.signin")}
        end
      end
    end
  	before do
		  @review= FactoryGirl.create(:review)
		  @worker=FactoryGirl.build(:worker)
		  @worker.reviews<<@review
		  @worker.save
	  end
    describe "authorization" do
      describe "for non-signed-in admins" do
        let(:admin) { FactoryGirl.create(:admin) }
       #let(:worker) { FactoryGirl.create(:worker) }
        describe "when attempting to visit a protected page" do
          before do
           visit edit_worker_path(@worker)
				   fill_in "Name", with: "new"
				   fill_in "Area", with: "area new"
				   fill_in "Status", with: "new status"
          end
          describe "after signing in" do
            it "should render the desired protected page" do
              expect(page).to have_title('Edit Worker')
              click_button "Save changes"
              expect(page).not_to have_title('Edit Worker')
            end
            describe "when signing in again" do
              before do
                click_link "Sign out"
                fill_in "Email", with: admin.email
                fill_in "Password", with: admin.password
                click_button "Sign in"
              end
              it "should render the default (profile) page" do
                expect(page).to have_title(admin.name)
              end
            end
          end
        end
        describe "in the Workers controller" do
      	  before do
			      @review= FactoryGirl.create(:review)
			      @worker=FactoryGirl.build(:worker)
			      @worker.reviews<<@review
			      @worker.save
		      end

          describe "visiting the edit page" do
            before { visit edit_worker_path(@worker) }
           # it { should have_selector('div.alert.alert-danger') }
          end
          let(:admin) { FactoryGirl.create(:admin) }
          let(:worker) { FactoryGirl.create(:worker) }
          before { sign_in admin }
          describe "submitting to the update action" do
            before do
              @review= FactoryGirl.create(:review)
              @worker=FactoryGirl.build(:worker)
              @worker.reviews<<@review
             @worker.save
            end
            before { put worker_path(@worker, {:worker => {"name" => "aaa"}}) }
            specify { response.should redirect_to(@worker)}
          end
          describe "visiting the user index" do
            before { visit workers_path }
          end
        end
      end 
 

      describe "as non admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
			    @review= FactoryGirl.create(:review)
			    @worker=FactoryGirl.build(:worker)
			    @worker.reviews<<@review
			    @worker.save
		    end
        before { sign_in admin }
        describe " submitting a DELETE request to the worker#destroy action" do
          before { delete worker_path(@worker) }
          it {response.should redirect_to(workers_path) }
        end
      end
    end
  end
end
