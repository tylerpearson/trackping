require 'spec_helper'

describe "Accounts" do
  describe "GET /accounts" do
    it "works! (now write some real specs)" do
      get accounts_path
      expect(response.status).to be(200)
    end
  end
end
