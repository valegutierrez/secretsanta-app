class ChangeEventsUsersToAttendances < ActiveRecord::Migration[5.2]
  def change
    rename_table :events_users, :attendances
  end
end
