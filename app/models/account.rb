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

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  belongs_to :user
  has_many :checks, dependent: :destroy

  validates :username, presence: true, uniqueness: { scope: :user,
    message: "should happen once per user", case_sensitive: false }

  validates :user, presence: true

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
    Profile.where(twitter_id: twitter_id.to_s).first
  end

  def current_following
    results = []
    ids = client.friend_ids(username)
    ids.each { |id| results << id }
    results
  end

  def current_followers
    results = []
    ids = client.follower_ids(username)
    ids.each { |id| results << id }
    results
  end

  def recent_changed_checks
    checks.where("followers_added != ? OR followers_removed != ? OR following_added != ? OR following_removed != ?", "--- []\n", "--- []\n", "--- []\n", "--- []\n").order(created_at: :desc)
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
        twitter_id: account.id.to_s,
        username: account.screen_name,
        description: account.description,
        avatar_url: account.profile_image_url.to_s,
        name: account.name}).first_or_create
    end

    def slug_candidates
      [
        :username,
        [:username, :id]
      ]
    end

end
