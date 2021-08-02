require_relative '../../pages/LoginHelper.rb'
require_relative '../../pages/Dashboard.rb'

describe 'Startscreen menu items' do
  context "selecting a menu item" do
    it 'do select a menu', case: 'ex02_1' do
      dashboard_url = 'https://explorer.stage.lfmprod.in/#dashboard/start'
      sign_in = LoginHelper.new
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
