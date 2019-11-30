class AddIndexHoldings < ActiveRecord::Migration[6.0]
  def change
      add_index :holdings, [:team_id, :stock_id]
  end
end
