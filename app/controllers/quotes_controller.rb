class QuotesController < ApplicationController
    
    def index
        
    end
    
    def search

    end

    def search_results
        @error = "No results found."
    end

    def show
        @quote = Quote.find(params[:id])
    end

    def new
        #check user is logged in
        #adding your own quote checks if the author exists, and if they don't, it creates the author object.
        @quote = Quote.new
    end

    def create
        #should check that user is logged in
        if Author.find_by(name: params[:quote][:author])
            not_new_author = Author.find_by(name: params[:quote][:author])
            @new_quote = Quote.create(content: params[:quote][:content], author_id: not_new_author.id)
        else
            new_author = Author.create(name: params[:quote][:author].titleize)
            @new_quote = Quote.create(content: params[:quote][:content], author_id: new_author.id)
        end
        redirect_to @new_quote
        #adding your own quote checks if the author exists, and if they don't, it creates the author object.
    end

    def edit 
        #only allow user to edit a quote if they are the author.
    end 

    def update
        #only allow user to edit a quote if they are the author.
    end

    def delete
        #author can only delete quotes they made
    end

end
