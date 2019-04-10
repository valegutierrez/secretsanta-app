class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.integer :first_user
      t.integer :second_user

      t.timestamps
    end
  end
end
