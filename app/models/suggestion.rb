class Suggestion < ApplicationRecord
    belongs_to  :user
    belongs_to  :teams
end
