module LoginPage 
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
    end

    def wait_for(timeout, &block)
      timein = 0
      success = false
      until timein == timeout do
        success = block.call()
        break if success
        sleep(0.1)
        timein += 0.1
      end
      failed = !success
      if failed
        raise "Try one more time"
      end 
    end
  end
end
