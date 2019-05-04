class ChangeContentToQuestion < ActiveRecord::Migration[5.2]
  def change
    rename_column :messages, :content, :question
  end
end
