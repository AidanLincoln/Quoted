require 'byebug'
require 'net/http'
require 'open-uri'
require 'json'
 
class GetQuoteData
 
  URL = "https://www.abbreviations.com/services/v2/quotes.php?uid=7596&tokenid=IgmEazP4Jp8I0Veo&searchtype=SEARCH&query=all&format=json"
 
  def get_quotes
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end
end

quotes = GetQuoteData.new.get_quotes

temp = JSON.parse(quotes)

#all quotes I want
qs = temp["result"].filter do |q|
    q["quote"].length < 400
end.uniq { |q| q["quote"]}

#object instantiations
qs.each do |authors_quote|
    author = Author.find_by name: authors_quote["author"]
    if !author
        author = Author.create(name: authors_quote["author"])
    end
    Quote.create(content:authors_quote["quote"], author_id: author.id)
end





# ["result"].each do|q|
#     puts q
# end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
