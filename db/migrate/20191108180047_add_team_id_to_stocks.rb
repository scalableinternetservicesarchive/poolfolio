class AddTeamIdToStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :team_id, :integer
  end
end
