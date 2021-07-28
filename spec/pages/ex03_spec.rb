require_relative '../../pages/LoginHelper.rb'
require_relative '../../pages/Dashboard.rb'
require_relative '../../pages/BrandListHelper.rb'

describe 'Brand listing' do
  context "Filter a brand" do
    it 'expected the filter brand', type: :feature do
      dashboard_url = 'https://explorer.stage.lfmprod.in/#dashboard/start'
      sign_in = LoginPage.new
      sign_in.load
      sleep 20
      sign_in.login('turneruser@turner.com', 'turnertest')
      expect(sign_in.current_url).to eq(dashboard_url)
      select_menu = Dashboard.new
      select_menu.click_item('Brands')  
      sleep 20
      brand_list = BrandListHelper.new  
      expect(brand_list.brand?('Full Frontal with Samantha Bee')).to eq true
      expect(brand_list.display_count).to eq 6
      expect(brand_list.total_count).to eq 6
      expect(brand_list.title_count).to eq 6
      brand_list.filter_by('Full Frontal with Samantha Bee')
      sleep 5
      expect(brand_list.display_count).to eq 1
      expect(brand_list.total_count).to eq 6
      expect(brand_list.title).to eq('Full Frontal with Samantha Bee')
      brand_list.clear_filter
      expect(brand_list.display_count).to eq 6
      expect(brand_list.total_count).to eq 6
      expect(brand_list.title_count).to eq 6
    end
  end
end
