# == Schema Information
#
# Table name: checks
#
#  id                :integer          not null, primary key
#  account_id        :integer
#  following         :text
#  followers         :text
#  created_at        :datetime
#  updated_at        :datetime
#  followers_added   :text
#  followers_removed :text
#  following_added   :text
#  following_removed :text
#

class Check < ActiveRecord::Base

  serialize :following
  serialize :followers
  serialize :followers_added
  serialize :followers_removed
  serialize :following_added
  serialize :following_removed

  validates :account, presence: true

  belongs_to :account

end
