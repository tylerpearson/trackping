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

require 'spec_helper'

describe Check do
  it { should validate_presence_of(:account) }
  it { should validate_presence_of(:following) }
  it { should validate_presence_of(:followers) }
end
