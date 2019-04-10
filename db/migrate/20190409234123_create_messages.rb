class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :conversation, foreign_key: true
      t.integer :sender_id
      t.integer :receiver_id
      t.text :content

      t.timestamps
    end
  end
end
