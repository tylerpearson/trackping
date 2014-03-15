class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @accounts = current_user.accounts
    @checks = current_user.recent_changed_checks
  end
end
