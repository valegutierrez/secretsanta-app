class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  def index
    @conversations = Conversation.all
    @notifications = current_user.notifications
    @notifications.update_all checked: true
  end

  def show
    @messages = @conversation.messages
    if (@conversation.first_user_id != current_user.id) and (@conversation.second_user_id != current_user.id)
      redirect_to conversations_path, alert: 'You do not have access to this conversation.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end
end
