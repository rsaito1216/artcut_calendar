class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to root_path
      else
        render 'new'
      end
  end

  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    @events = @user.events
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :encripted_password) 
  end
end