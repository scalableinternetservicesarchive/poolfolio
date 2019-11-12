class RemoveColumnTotalVotesFromSuggestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :suggestions, :total_votes
  end
end
