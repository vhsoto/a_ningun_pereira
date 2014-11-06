class UsersController < ApplicationController
   before_action :authenticate_user!, except: [:show]
   
   def update
     if current_user.update(user_params)
       flash[:notice] = "Información del usuario actualizada correctamente."
       redirect_to edit_user_registration_path
     else
       flash[:error] = "Información inválida del usuario."
       redirect_to edit_user_registration_path
     end
   end

   def show
     @user = User.find(params[:id])
     authorize @user
     @complaints_public = @user.complaints.where(public: true)
     @complaints_private = @user.complaints.where(public: false)
   end
 
   private
 
   def user_params
     params.require(:user).permit(:name, :avatar, :avatar_cache, :remove_avatar)
   end
 end