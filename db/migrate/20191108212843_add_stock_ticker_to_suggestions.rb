class AddStockTickerToSuggestions < ActiveRecord::Migration[6.0]
  def change
    add_column :suggestions, :ticker, :string
  end
end
