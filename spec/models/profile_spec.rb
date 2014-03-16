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
#  twitter_id  :integer
#  name        :string(255)
#

require 'spec_helper'

describe Profile do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:twitter_id) }
end
