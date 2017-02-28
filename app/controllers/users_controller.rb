class UsersController < ApplicationController
  # before_action :authenticate_user!, only: [:edit, :update_password]
    # skip_before_action :authenticate_user!
  def new
    @user = User.new
  end

  def create
      @user = User.new user_params
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Accounted created!"
      else
       render :new
     end
   end

   def edit
      # @user = current_user
      @user = User.find params[:id]
   end

  private

  def user_params
  params.require(:user).permit(:first_name,
                               :last_name,
                               :email,
                               :password,
                               :password_confirmation)
  end

end
