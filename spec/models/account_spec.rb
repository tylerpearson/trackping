# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  twitter_id :integer
#  slug       :string(255)
#

require 'spec_helper'

describe Account do
  it { should belong_to(:user) }
end
