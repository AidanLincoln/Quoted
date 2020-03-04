class AuthorsController < ApplicationController

    def index

    end

    def show
        @author = Author.find(params[:id])
    end

    def new
        #dont need?
    end

    def create
        #^^
    end

    def edit 
        #only allows user to edit quotes they are the author of.
    end

    def update
        #only allows user to edit quotes they are the author of.
    end

    def destroy
        #only allows user to delete quote if they are the author.
    end
end
