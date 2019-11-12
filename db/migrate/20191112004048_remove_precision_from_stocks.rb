class RemovePrecisionFromStocks < ActiveRecord::Migration[6.0]
  def change
    remove_column :stocks, :price
    add_column :stocks, :price, :integer
  end
end
