class AddUserGuessIdToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :user_guess_id, :integer
  end
end