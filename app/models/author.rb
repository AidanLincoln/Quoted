class Author < ApplicationRecord
    has_many :quotes
    def self.search(search_term)
        Author.find_by(name: search_term)
    end
end
