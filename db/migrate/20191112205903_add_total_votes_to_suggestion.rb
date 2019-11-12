class AddTotalVotesToSuggestion < ActiveRecord::Migration[6.0]
  def change
    add_column :suggestions, :total_votes, :integer
  end
end
