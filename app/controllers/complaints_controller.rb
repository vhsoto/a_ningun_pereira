class ComplaintsController < ApplicationController
  before_action :set_complaint , only: [:show, :edit, :update , :destroy]
  def index
    @complaints = Complaint.paginate(:page => params[:page], :per_page => 10).visibles
    authorize @complaints
  end

  def show
    authorize @complaint
    @comments = @complaint.comments
  end

  def new
    @complaint = Complaint.new
    authorize @complaint
  end

  def create
    @complaint = current_user.complaints.create(complaint_params)
    authorize @complaint
    if @complaint.save
      @complaint.crear_voto
      redirect_to @complaint, notice: "Guardo con éxito!"
    else
      flash[:alert] = "No se pudo crear la queja. Intenta nuevamente."
      render :new
    end
  end

  def edit
    authorize @complaint
  end

  def update
    authorize @complaint
    if @complaint.update(complaint_params)
      redirect_to @complaint, notice: "Se actualizó con éxito"
    else
      flash[:error] = "Hubo un error al actualizar la queja. Intenta nuevamente."
      render :edit
    end
  end

  def destroy
    authorize @complaint
    if @complaint.destroy
      redirect_to complaints_path, notice: "Se eliminó con éxito"
    else
      flash[:error] = "No se pudo eliminar la queja. Intente de nuevo."
      redirect_to @complaint
    end
  end

  private
  def set_complaint
    @complaint = Complaint.find(params[:id])
  end
  def complaint_params
    params.require(:complaint).permit(:title, :body, :picture, :picture_cache, :public)
  end
end