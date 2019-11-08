class AddUniquenessToStockTickerIndexInStocks < ActiveRecord::Migration[6.0]
  def change
    remove_index  :stocks, :ticker
  end
end
