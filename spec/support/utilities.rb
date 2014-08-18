include ApplicationHelper

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-error', text: 'Invalid')
	end
end

def sign_in(admin)
      visit admin_session_path
      fill_in "Email", with: admin.email
      fill_in "Password", with: admin.password
      click_button "Sign in"
  

end