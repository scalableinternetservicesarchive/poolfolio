class Suggestion < ApplicationRecord

    belongs_to  :user
    belongs_to  :team

    #Votable Suggestions
    acts_as_votable
end
