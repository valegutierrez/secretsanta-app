class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
    @notifications = current_user.notifications
    @notifications.update_all checked: true
  end

  def show
  end
end
