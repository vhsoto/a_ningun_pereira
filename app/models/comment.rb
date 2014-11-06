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

class Comment < ActiveRecord::Base
  belongs_to :complaint
  belongs_to :user
  default_scope {order('updated_at DESC')}
  
end
