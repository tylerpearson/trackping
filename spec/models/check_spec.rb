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
  pending "add some examples to (or delete) #{__FILE__}"
end
