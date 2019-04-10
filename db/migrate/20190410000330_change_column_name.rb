class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :conversations, :first_user, :first_user_id
    rename_column :conversations, :second_user, :second_user_id
  end
end
