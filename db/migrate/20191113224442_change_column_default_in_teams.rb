class ChangeColumnDefaultInTeams < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:teams, :balance, 50)
  end
end
