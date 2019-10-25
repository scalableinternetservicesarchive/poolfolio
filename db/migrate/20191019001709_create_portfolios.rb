class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :portfolio_name
      t.float :portfolio_value

      t.timestamps
    end
  end
end
