class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def show
  end
end
