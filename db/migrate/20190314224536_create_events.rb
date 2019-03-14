class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :members
      t.integer :price_start
      t.integer :price_end
      t.datetime :deadline
      t.integer :admin_id

      t.timestamps
    end
  end
end
