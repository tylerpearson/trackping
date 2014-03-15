require 'spec_helper'

describe "accounts/new" do
  before(:each) do
    assign(:account, stub_model(Account,
      :username => "MyString"
    ).as_new_record)
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do
      assert_select "input#account_username[name=?]", "account[username]"
    end
  end
end
