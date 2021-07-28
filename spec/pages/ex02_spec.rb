require_relative '../../pages/LoginHelper.rb'
require_relative '../../pages/Dashboard.rb'
describe 'Startscreen menu items' do
  context "selecting a menu item" do
    it 'do select a menu', type: :feature do
      dashboard_url = 'https://explorer.stage.lfmprod.in/#dashboard/start'
      sign_in = LoginPage.new
      sign_in.load
      sleep 20
      sign_in.login('turneruser@turner.com', 'turnertest')
      expect(sign_in.current_url).to eq(dashboard_url)
			select_menu = Dashboard.new
      select_menu.click_item('Brands')  
      sleep 20
    end
  end
end
