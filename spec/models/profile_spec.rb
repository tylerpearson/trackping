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
  pending "add some examples to (or delete) #{__FILE__}"
end
