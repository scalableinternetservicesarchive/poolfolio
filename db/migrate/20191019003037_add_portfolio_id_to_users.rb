class AddPortfolioIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :portfolio_id, :int
  end
end
