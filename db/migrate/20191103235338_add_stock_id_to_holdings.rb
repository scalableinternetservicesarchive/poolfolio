class AddStockIdToHoldings < ActiveRecord::Migration[6.0]
  def change
    add_column :holdings, :stock_id, :integer
  end
end
