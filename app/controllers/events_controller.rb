class EventsController < ApplicationController
  before_action :store_user_location!, only: [:shared_event]
  before_action :authenticate_user! 
  before_action :set_event, only: [:show, :edit, :update, :destroy, :create_attendances, :create_conversations, :delete_attendances, :delete_conversations]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    if @event.attendances.where(user_id: current_user.id).count <= 0
      redirect_to events_path, alert: 'You cannot enter this event.'
    end
    @users = User.all
    if @event.deadline < Time.now
      redirect_to events_path, alert: 'This event has finished.'
    end
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
    @event = Event.new(event_params.merge({admin_id: current_user.id}))

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
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
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def shared_event
    @event_url = after_sign_in_path_for(:user)
    @event_url.slice! "/events/"
    @event = Event.find(@event_url.to_i)
    if @event.present?
      if @event.attendances.where(user_id: current_user).size == 0
        unless @event.add_new_user(current_user)
          redirect_to events_path, alert: 'This event is full.'
          return
        end
      end
      redirect_to @event
    else
      redirect_to events_path, alert: 'This event does not exist.'
    end
  end

  def invite_user
    @event = event
  end

  def create_conversations
    guests = @event.attendances.shuffle
    guests_rotated = guests.rotate
    pairs = guests.zip(guests_rotated)
    pairs.each do |c|
      conversation = Conversation.create(first_user_id: c[0].user_id, second_user_id: c[1].user_id, event_id: @event.id)
    end
    @event.update!(event_chat: true)
    redirect_to @event, notice: 'The Secret Santas has been succesfully distributed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def store_user_location!
      @event = Event.find_by_access_code_link(params[:code])
      # :user is the scope we are authenticating
      store_location_for(:user, url_for(@event))
    end

    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || super
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :members, :price_limit, :deadline, :admin_id)
    end
end
