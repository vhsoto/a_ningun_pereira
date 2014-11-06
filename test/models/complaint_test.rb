# == Schema Information
#
# Table name: complaints
#
#  id         :integer          not null, primary key
#  title      :string(255)      default("")
#  body       :text             default("")
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  picture    :string(255)
#  public     :boolean          default(FALSE)
#

require 'test_helper'

class ComplaintTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
