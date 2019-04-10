class AddFieldAccessLinkToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :access_code_link, :string
  end
end
