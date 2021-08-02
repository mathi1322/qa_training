require_relative '../../pages/LoginHelper.rb'

describe 'Login Process' do
  context "when user log in" do
    it 'user can sign in', case: 'ex01_1' do
      dashboard_url = 'https://explorer.stage.lfmprod.in/#dashboard/start'
      sign_in = LoginHelper.new
      sign_in.load
      sleep 20
      sign_in.login('turneruser@turner.com', 'turnertest')
      expect(sign_in.current_url).to eq(dashboard_url)
    end
  end
end
