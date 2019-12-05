class UserIndexCleanuo < ActiveRecord::Migration[6.0]
  def change
      remove_index :users, :reset_password_token
      remove_index :users, :email
  end
end
