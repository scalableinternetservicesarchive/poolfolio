class RemoveIndexSuggestions < ActiveRecord::Migration[6.0]
  def change
      remove_index :suggestions, :team_id
      remove_index :suggestions, :user_id
  end
end
