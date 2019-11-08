class AddTeamIdToHoldings < ActiveRecord::Migration[6.0]
  def change
    add_column :Holdings, :team_id, :integer
    add_index  :Holdings, :team_id
  end
end
