class Team < ApplicationRecord
  has_many  :users
  has_many  :suggestions
  has_many  :holdings
end
