class Post < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :comments

  validates :game_name, :gamer_tag, :platform, presence: true
end
