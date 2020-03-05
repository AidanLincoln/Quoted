class Quote < ApplicationRecord
    belongs_to :author
    has_many :users_quotes
    has_many :users, through: :users_quotes
    validates :content, presence: true
    validates :author_id, presence: true
    def self.search(search_term)
        Quote.all.filter do |quote|
            quote.content.include?(search_term)
        end
    end
end
