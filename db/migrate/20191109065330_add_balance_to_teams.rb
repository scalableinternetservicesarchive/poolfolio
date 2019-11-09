class AddBalanceToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :balance, :integer
  end
end
