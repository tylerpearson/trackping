require 'spec_helper'

describe "accounts/show" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :username => "Username"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
  end
end
