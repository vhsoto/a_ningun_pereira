# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  body         :text             default("")
#  complaint_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
