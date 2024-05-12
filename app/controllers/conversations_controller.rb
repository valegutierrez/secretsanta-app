class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  def index
    @conversations = Conversation.all
    @notifications = current_user.notifications
    @notifications.update_all checked: true
  end

  def show
    @attendance = Attendance.find_by(event_id: @conversation.event_id, user_id: @conversation.second_user_id)
    @messages = @conversation.messages
    # Determine who is receiving the message
    if @conversation.first_user_id == current_user.id
      @message = @conversation.messages.new(sender_id: current_user.id, receiver_id: @conversation.second_user_id)
    elsif @conversation.second_user_id == current_user.id
      @message = @conversation.messages.new(sender_id: current_user.id, receiver_id: @conversation.first_user_id)
    else
      redirect_to conversations_path, alert: 'You do not have access to this conversation.'
    end
    @message.answers.new
    @message.answers.new
    @message.answers.new
    @message.answers.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end
end
