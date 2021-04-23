class User < ApplicationRecord
    has_many :posts
    has_many :comments
    has_many :games, through: :posts
    has_many :post_comments, through: :comments,
    source: :post
end
