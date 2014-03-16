module ApplicationHelper

  def account_info(twitter_id)
    Profile.where(twitter_id: twitter_id.to_s).first
  end

  def hq_avatar(url)
    url.gsub('normal','bigger')
  end

end
