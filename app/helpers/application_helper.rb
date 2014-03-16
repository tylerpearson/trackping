module ApplicationHelper

  def account_info(twitter_id)
    Profile.where(twitter_id: twitter_id).first
  end

end
