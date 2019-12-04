class Suggestion < ApplicationRecord

    belongs_to  :user
    belongs_to  :team, touch: true
    validates :team_id, presence: true
    validates :user_id, presence: true
    default_scope -> { order(cached_votes_score: :desc) }

    #Votable Suggestions
    acts_as_votable
end
