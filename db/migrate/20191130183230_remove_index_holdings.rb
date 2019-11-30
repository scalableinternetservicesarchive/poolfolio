class RemoveIndexHoldings < ActiveRecord::Migration[6.0]
  def change
      remove_index :holdings, :team_id
  end
end
