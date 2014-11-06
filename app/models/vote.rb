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

class Vote < ActiveRecord::Base
	after_save :actualizar_queja
  belongs_to :user
  belongs_to :complaint

  validates :value, inclusion: {in: [-1, 1], message: "%{value} no es un voto valido"}

  def voto_positivo?
  	value == 1
  end

  def voto_negativo?
  	value == -1
  end

  def actualizar_queja
  	complaint.actualizar_ranking
  end
end
