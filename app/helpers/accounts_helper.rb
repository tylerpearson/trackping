module AccountsHelper

  def profile(id)
    Profile.where(twitter_id: id).first
  end


end
