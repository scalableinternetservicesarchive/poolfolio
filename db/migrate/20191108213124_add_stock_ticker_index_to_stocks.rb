class AddStockTickerIndexToStocks < ActiveRecord::Migration[6.0]
  def change
    add_index  :Stocks, :ticker
  end
end
