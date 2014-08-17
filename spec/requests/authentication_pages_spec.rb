require 'rails_helper'

RSpec.describe "AuthenticationPages", :type => :request do

	subject { page }
  describe "GET /authentication_pages" do

  	describe "signin page" do
  		before { visit root_path }
  	end
  
  describe "sign in" do
     before { visit root_path }
    describe "with valid info" do
    		before { click_button "Sign in"}
    		
  			it { should have_selector('div.alert.alert-danger', text: 'Invalid') }

   			describe "after visiting anothe page" do
	  			 before { click_link "About Us" }
	  			it { should_not have_selector('div.alert.alert-danger') }
   			end
    end
    describe "with invalid info" do


    end

        describe "with valid info" do

         let(:admin) { FactoryGirl.create(:admin) }
         before { sign_in admin }
 
        it "should have  title" do
      expect(page).to have_title(admin.name)
    end
    it { should have_link('Sign out', href: signout_path) }
    it { should have_link('Workers',  href: workers_path) }
    it { should_not have_link('Sign in', href: signin_path) }

    describe "follow by signout" do
    	before { click_link "Sign out" }
    #it {should have_css("form.signin")}

    end

end


 
  end
  end
  describe "authorization" do
    describe "for non-signed-in admins" do
      let(:admin) { FactoryGirl.create(:admin) }
      let(:worker) { FactoryGirl.create(:worker) }
      describe "when attempting to visit a protected page" do
       before do
        visit edit_worker_path(user)
				fill_in "Name", with: new_name
				fill_in "Area", with: new_area
				fill_in "Status", with: new_status

        click_button "Sign in"
       end
       describe "after signing in" do
        it "should render the desired protected page" do
         
                 expect(page).to have_title('Edit Worker')
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

        describe "visiting the edit page" do
          before { visit edit_worker_path(worker) }
   
    it { should have_selector('div.alert.alert-danger') }

        end
        describe "submitting to the update action" do
          before { put worker_path(worker) }
          specify { response.should redirect_to(root_path)}

        end
        describe "visiting the user index" do
          before { visit workers_path }
         
        end

      end

      describe "as wrong Admin" do
       let(:admin) { FactoryGirl.create(:admin) }
       let(:wrong_admin) { FactoryGirl.create(:admin, email: "wrong@example.com") }
       before { sign_in user}
       describe "visiting Workers#edit page" do
        before { visit edit_worker_path(wrong_admin) }
       it "should have  title" do
         expect(page).not_to have_title('Edit Worker')
        end
       end
       describe "submitting a PUT request to the workers#update action" do
          before { put worker_path(wrong_admin) }
          specify { response.should redirect_to(root_path) }
       end
      end

      describe "as non admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        let(:non_admin) { FactoryGirl.create(:worker) }

        before { sign_in non_admin }

        describe " submitting a DELETE request to the worker#destroy action" do
          before { delete worker_path(worker) }
          specify { response.should redirect_to(root_path) }
        end

      end
    end

  end
end
