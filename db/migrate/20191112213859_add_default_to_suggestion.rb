class AddDefaultToSuggestion < ActiveRecord::Migration[6.0]
  def change
    change_column :suggestions, :total_votes, :integer, default: 0
  end
end
