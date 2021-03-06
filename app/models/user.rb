class User < ApplicationRecord
    has_many :users_quotes
    has_many :quotes, through: :users_quotes, dependent: :destroy
    validates :username, presence: true
    # validates :password, {presence: true, on: :create}
    validates :username, uniqueness: true
    has_secure_password
end
