class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :comments
    has_many :games, through: :posts

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
end
