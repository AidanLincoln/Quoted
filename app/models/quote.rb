class Quote < ApplicationRecord
    belongs_to :author
    has_many :users_quotes
    has_many :users, through: :users_quotes
    def self.search(search_term)
        Quote.all.filter do |quote|
            quote.content.include?(search_term)
        end
    end
end
