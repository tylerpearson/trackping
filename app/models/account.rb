# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  twitter_id :string(255)
#

class Account < ActiveRecord::Base

  belongs_to :user
  has_many :checks, dependent: :destroy

  validates :username, presence: true, uniqueness: { scope: :user,
    message: "should happen once per user", case_sensitive: false }

  validates_length_of :username, :minimum => 1, :maximum => 16, :allow_blank => false

  validate :twitter_user_exists

  after_create :set_twitter_id, :do_first_check, :create_profile

  def to_s
    username
  end

  def client
    user.client
  end

  def profile
    Profile.where(twitter_id: twitter_id).first
  end

  def current_following
    results = []
    ids = client.friend_ids(@id)
    ids.each { |id| results << id }
    results
  end

  def current_followers
    results = []
    ids = client.follower_ids(@id)
    ids.each { |id| results << id }
    results
  end

  private

    def do_first_check
      check = self.checks.create(followers: current_followers, following: current_following)
    end

    def twitter_user_exists
      begin
        user.client.user(username)
      rescue
        errors.add(:base, 'Must be an existing Twitter account')
      end
    end

    def set_twitter_id
      self.twitter_id = client.user(username).id.to_s
      self.save
    end

    def create_profile
      account = client.users(username).first

      Profile.where({
        twitter_id: account.id,
        username: account.screen_name,
        description: account.description,
        avatar_url: account.profile_image_url.to_s,
        name: account.name}).first_or_create
    end

end
