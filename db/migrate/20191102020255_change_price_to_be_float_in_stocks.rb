class ChangePriceToBeFloatInStocks < ActiveRecord::Migration[6.0]
  def change
    change_column :stocks, :price, :decimal, :precision => 10, :scale => 2
  end
end
