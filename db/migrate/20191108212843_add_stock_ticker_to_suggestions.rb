class AddStockTickerToSuggestions < ActiveRecord::Migration[6.0]
  def change
    add_column :Suggestions, :ticker, :string
  end
end
