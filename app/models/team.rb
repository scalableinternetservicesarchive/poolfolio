class Team < ApplicationRecord
  has_many  :users
  has_many  :suggestions
  has_many  :holdings
  has_many  :suggestions, dependent: :destroy
  
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
  
  def user_count
    Rails.cache.fetch("#{cache_key}/team_user_count") { self.users.size }
  end
end
