class CommentsController < ApplicationController
  respond_to :html, :js
	
  def create
  	 @complaint = Complaint.find(params[:complaint_id])
  	 @comment = @complaint.comments.create(comment_params)
     @comment.user = current_user 
     authorize @comment
    if @comment.save
      flash[:notice] = "Guardo con éxito!" 
    else
      flash[:alert] = "No se pudo crear el comentario. Intenta nuevamente."      
    end
    respond_with(@comment) do |format|
      format.html {redirect_to @complaint}
    end
  end

  def update
    @complaint = Complaint.find(params[:complaint_id])
    @comment = @complaint.comments.update(comment_params)
    @comment.user = current_user
    authorize @comment
    if @comment.update
      flash[:notice] = "Se actualizó con éxito"
    else
      flash[:error] = "Hubo un error al actualizar la queja. Intenta nuevamente."      
    end
    respond_with(@comment) do |format|
      format.html {redirect_to @complaint}
    end
  end


  def destroy
    @complaint = Complaint.find(params[:complaint_id])
    @comment = @complaint.comments.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Se eliminó con éxito"
    else
      flash[:error] = "No se eliminó"
    end
    respond_with(@comment) do |format|
      format.html {redirect_to @complaint}
    end
  end

  private
  def comment_params
  	params.require(:comment).permit(:body)
  end



end