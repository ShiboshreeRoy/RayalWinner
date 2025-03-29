class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:update]

  def index
    @users = User.all
    @user = User.new
  end

  def create
    # Implementation for creating a user (to be added)
  end

  def update
    if @user.update(user_params)
      redirect_to admin_index_path, notice: "User updated successfully."
    else
      redirect_to admin_index_path, alert: "Unable to update user."
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    redirect_to admin_index_path, alert: "User not found." unless @user
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role) # Adjust permitted parameters as needed
  end
end
