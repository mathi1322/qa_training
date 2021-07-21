module LoginHelper
  extend Capybara::DSL

  class << self
    def login
      visit Config.get_value(:dashboard_url) 
      sleep(5)
      user = Config.credentials_of(:username)
      pass = Config.credentials_of(:password)
      within("form.cognito-asf") do
        fill_in 'username', with: user
        fill_in 'password', with: pass
        find("input.btn.btn-primary.submitButton-customizable").click
      end
      #find("input.btn.btn-primary.submitButton-customizable").click
    end
  end
end

