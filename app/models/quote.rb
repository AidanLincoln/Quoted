class Quote < ApplicationRecord
    belongs_to :author
    has_many :users_quotes
    has_many :users, through: :users_quotes
end
