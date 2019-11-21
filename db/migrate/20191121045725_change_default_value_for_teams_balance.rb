class ChangeDefaultValueForTeamsBalance < ActiveRecord::Migration[6.0]
  def change
    change_column :teams, :balance, :integer, default: 0
  end
end
