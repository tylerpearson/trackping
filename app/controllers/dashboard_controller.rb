class DashboardController < ApplicationController
  def index
    @accounts = current_user.accounts
    @checks = current_user.recent_changed_checks
  end
end
