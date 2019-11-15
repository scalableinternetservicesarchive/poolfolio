class Team < ApplicationRecord
  has_many  :users
  has_many  :suggestions
  has_many  :holdings
  has_many  :suggestions, dependent: :destroy
  
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
end
