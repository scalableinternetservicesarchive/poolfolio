class Team < ApplicationRecord
  has_many  :users
  has_many  :suggestions
  has_many  :holdings
  
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
end
