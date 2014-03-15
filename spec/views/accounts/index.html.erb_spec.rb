require 'spec_helper'

describe "accounts/index" do
  before(:each) do
    assign(:accounts, [
      stub_model(Account,
        :username => "Username"
      ),
      stub_model(Account,
        :username => "Username"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
  end
end
