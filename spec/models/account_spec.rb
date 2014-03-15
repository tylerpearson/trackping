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

require 'spec_helper'

describe Account do
  pending "add some examples to (or delete) #{__FILE__}"
end
