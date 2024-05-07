class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show] # Ensure user is authenticated for all actions except show

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to root_path, alert: "User not found"
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice: "Profile updated successfully"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
