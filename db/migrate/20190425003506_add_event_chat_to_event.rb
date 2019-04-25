class AddEventChatToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_chat, :boolean, null: false, default: false
  end
end
