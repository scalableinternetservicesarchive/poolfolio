class AddDefaultToTeamsValue < ActiveRecord::Migration[6.0]
  def change
    change_column :teams, :value, :integer, default: 0
  end
end
