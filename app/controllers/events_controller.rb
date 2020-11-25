class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:new]
  before_action :no_edit_user, only: [:edit]
  before_action :show_login_check, only: [:show]
  before_action :limited_user, only: [:show]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    
    respond_to do |format|
      if @event.save
        UserMailer.send_mail(@event).deliver
        format.html { redirect_to @event, notice: '予約が登録されました。カレンダーに予約が反映されているか確認してください。' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: '予約内容が変更されました。カレンダーに変更が反映されているか確認してください。' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: '予約を取り消しました。カレンダーから消えているか確認してください。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :description, :start_date, :end_date).merge(user_id: current_user.id)
    end

    def login_check
      unless user_signed_in?
        flash[:alert] = "予約するにはログインか新規登録をしてください"
        redirect_to new_user_session_path
      end
    end

    def no_edit_user
      if user_signed_in? && (!(current_user.id == @event.user_id)) && !current_user.admin
        redirect_to root_path
      end
    end

    def limited_user
      if user_signed_in? && (!(current_user.id == @event.user_id)) && !current_user.admin
        redirect_to root_path
      end
    end

    def show_login_check
      unless user_signed_in?
        redirect_to root_path
      end
    end
end
