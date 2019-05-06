class RemovePriceStartFromEvent < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :price_start, :integer
  end
end
