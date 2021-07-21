require '/home/mathivanan/git/qa_training/spec/helper/login_helper.rb'
require '/home/mathivanan/git/qa_training/lib/config.rb'

describe "the signin process", type: :feature do
  it "signs me in" do
    LoginHelper.login
    sleep 20
    expect(page.current_url).to eq(Config.get_value(:dashboard_url))
  end
end
