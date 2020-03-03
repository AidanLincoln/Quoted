class User < ApplicationRecord
    has_many :users_quotes
    has_many :quotes, through: :users_quotes
end
