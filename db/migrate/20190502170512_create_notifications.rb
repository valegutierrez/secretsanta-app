class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :conversation, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :checked, null: false, default: false

      t.timestamps
    end
  end
end
