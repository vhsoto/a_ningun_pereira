class VotesController < ApplicationController
	before_action :cargar_voto_queja
	def voto_acuerdo
		actualizar_voto!(1)
		redirect_to :back
	end
	def voto_desacuerdo
		actualizar_voto!(-1)
		redirect_to :back
	end
	private
	def cargar_voto_queja
		@queja = Complaint.find(params[:complaint_id])
		@voto = @queja.votes.where(user: current_user).first
	end
	def actualizar_voto!(valor)
		if @voto
			@voto.update(value: valor)
		else
			current_user.votes.create(value: valor, complaint: @queja)
		end
	end


end