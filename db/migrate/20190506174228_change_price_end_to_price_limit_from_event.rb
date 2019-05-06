class ChangePriceEndToPriceLimitFromEvent < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :price_end, :price_limit
  end
end
