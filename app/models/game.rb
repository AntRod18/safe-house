class Game < ApplicationRecord
    has_many :posts
    has_many :users, through: :posts

    scope :search, -> (params){where("Lower(title)= ?", params)}
end
