class AddStockTickerIndexToStocks < ActiveRecord::Migration[6.0]
  def change
    add_index  :stocks, :ticker
  end
end
