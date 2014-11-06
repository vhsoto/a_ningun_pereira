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

class Complaint < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_many :votes, dependent: :destroy
	belongs_to :user
  mount_uploader :picture, PictureUploader
  default_scope {order('rank DESC')}
  scope :visibles, -> {where(public: true)}
  validates :title, length: {minimum: 10, maximum: 500}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :user, presence: true
  # validates :picture, format: {with:  /([^\s]+(\.(?i)(jpg|png|jpeg|gif|bmp))$)/ }

  def puntos
  	votes.sum(:value)
  end

  def votos_acuerdo
  	votes.where(value: 1).count
  end

  def votos_desacuerdo
  	votes.where(value: -1).count
  end

  def actualizar_ranking
  	edad = (created_at - Time.new(2000,1,1)) / (60*60*24)
  	ranking = puntos + edad
  	update(rank: ranking)
  end

  def crear_voto
  	user.votes.create(value: 1, complaint: self)
  end
end
