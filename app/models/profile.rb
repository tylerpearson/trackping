# == Schema Information
#
# Table name: profiles
#
#  id          :integer          not null, primary key
#  username    :string(255)
#  description :text
#  avatar_url  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  twitter_id  :string(255)
#

class Profile < ActiveRecord::Base
end