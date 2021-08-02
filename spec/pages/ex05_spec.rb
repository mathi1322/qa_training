require '/home/mathivanan/git/qa_training/pages/LoginPage.rb'
require '/home/mathivanan/git/qa_training/lib/config.rb'
require '/home/mathivanan/git/qa_training/pages/Dashboard.rb'

describe "Login process", type: :feature do
  context "using a config file" do
    it "signs me in", case: 'ex05_1' do
      LoginPage.login
      sleep 20
      expect(page.current_url).to eq(Config.get_value(:dashboard_url))
    end 
    it "selecting menu item", case: 'ex05_2' do
      sign = Dashboard.new
      sign.click_item('Brands')
      sleep 20
    end 
  end  
end
