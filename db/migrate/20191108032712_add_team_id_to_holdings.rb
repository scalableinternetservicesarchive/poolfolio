class AddTeamIdToHoldings < ActiveRecord::Migration[6.0]
  def change
    add_column :holdings, :team_id, :integer
    add_index  :holdings, :team_id
  end
end
