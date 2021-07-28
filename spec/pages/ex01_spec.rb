require_relative '../../pages/LoginHelper.rb'
describe 'Login Process' do
  context "when user log in" do
    it 'user can sign in', type: :feature do
      dashboard_url = 'https://explorer.stage.lfmprod.in/#dashboard/start'
      sign_in = LoginPage.new
      sign_in.load
      sleep 20
      sign_in.login('turneruser@turner.com', 'turnertest')
      expect(sign_in.current_url).to eq(dashboard_url)
    end
  end
end
