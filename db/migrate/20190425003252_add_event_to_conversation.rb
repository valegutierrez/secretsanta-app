class AddEventToConversation < ActiveRecord::Migration[5.2]
  def change
    add_reference :conversations, :event, foreign_key: true
  end
end
