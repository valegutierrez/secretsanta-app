class DropGuessesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :guesses
  end
end
