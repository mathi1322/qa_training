require_relative '../../pages/LoginHelper.rb'
require_relative '../../pages/Dashboard.rb'
require_relative '../../pages/BrandList.rb'

describe 'Brand listing' do
  context "verifying the aggregate row value matches the listing brands" do
    it 'returns true', type: :feature do
      dashboard_url = 'https://explorer.stage.lfmprod.in/#dashboard/start'
      sign_in = LoginHelper.new
      sign_in.load
      sleep 20
      sign_in.login('turneruser@turner.com', 'turnertest')
      expect(sign_in.current_url).to eq(dashboard_url)
      select_menu = Dashboard.new
      select_menu.click_item('Brands')  
      sleep 20
      brand_list = BrandList.new
      expect(brand_list.fangrowth_data).to eq(true)
    end
  end
end
