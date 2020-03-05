class QuotesController < ApplicationController
    before_action :authorized, only: [:new, :edit, :destroy]
    def index
        
    end
    
    def home

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
        params[:quote][:author] = params[:quote][:author].titleize
        if Author.find_by(name: params[:quote][:author])
            not_new_author = Author.find_by(name: params[:quote][:author])
            @new_quote = Quote.create(content: params[:quote][:content], author_id: not_new_author.id)
        else
            new_author = Author.create(name: params[:quote][:author])
            @new_quote = Quote.create(content: params[:quote][:content], author_id: new_author.id)
        end
        redirect_to @new_quote
        #adding your own quote checks if the author exists, and if they don't, it creates the author object.
    end

    def edit 
        @quote = Quote.find(params[:id])
        #only allow user to edit a quote if they are the author.
    end 

    def update
        params[:quote][:author] = params[:quote][:author].titleize
        @quote = Quote.find(params[:id])
        if Author.find_by(name: params[:quote][:author])
            not_new_author = Author.find_by(name: params[:quote][:author])
            @quote.update(content: params[:quote][:content], author_id: not_new_author.id)
        else
            new_author = Author.create(name: params[:quote][:author].titleize)
            @quote.update(content: params[:quote][:content], author_id: new_author.id)
        end
        if @quote.valid?
            redirect_to user_path(session[:user_id])
        else 
            flash[:messages] = "Oops!"
            render :edit
        end
        #only allow user to edit a quote if they are the author.
    end

    def destroy
        @user = User.find(session[:user_id])
        @quote = Quote.find(params[:quote_id])
        if Author.find(@quote.author_id).name == @user.username
            @quote.destroy
            redirect_to @user
        else
            nil
        end
        #author can only delete quotes they made
    end

    private
    def quote_params
        params.require(:quote).permit(:content, :author_id)
    end

end
