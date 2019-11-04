class AddTeamIdToSuggestions < ActiveRecord::Migration[6.0]
  def change
    add_column :suggestions, :team_id, :integer
    add_index  :suggestions, :team_id
  end
end
