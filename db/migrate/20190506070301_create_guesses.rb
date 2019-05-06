class CreateGuesses < ActiveRecord::Migration[5.2]
  def change
    create_table :guesses do |t|
      t.references :user, foreign_key: true
      t.integer :user_guess_id

      t.timestamps
    end
  end
end
