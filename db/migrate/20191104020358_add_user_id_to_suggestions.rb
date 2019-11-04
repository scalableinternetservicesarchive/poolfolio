class AddUserIdToSuggestions < ActiveRecord::Migration[6.0]
  def change
    add_column :suggestions, :user_id, :integer
    add_index  :suggestions, :user_id
  end
end
