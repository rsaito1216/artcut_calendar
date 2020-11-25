class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
        
      if @user.save
        format.html { redirect_to @event, notice: '予約が登録されました。カレンダーに予約が反映されているか確認してください。' }
        format.json { render :show, status: :created, location: @event }
      else
        render 'new'
      end
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