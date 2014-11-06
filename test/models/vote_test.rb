# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  value        :integer          default(0)
#  user_id      :integer
#  complaint_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
