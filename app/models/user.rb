class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :comments
    has_many :games, through: :posts

    validates :user_name, :login, :email, presence: true
    validates :user_name, :email, uniqueness: true
end
