class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to @user
        else 
            flash[:messages] = "Please enter both fields."
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = current_user
        @user.update(user_params)
        if @user.valid?
            redirect_to @user
        else 
            flash[:messages] = "Oops!"
            render :new
        end
    end

    def add_favorite_quote
        @new_fav = UsersQuote.create(user_id: session[:user_id], quote_id: params[:quote_id])
        redirect_to favorites_path
    end

    def favorites
        @user = User.find(session[:user_id])
    end

    def remove_favorite
        @usersquote = UsersQuote.find_by(user_id: session[:user_id], quote_id: params[:quote_id])
        @usersquote.destroy
        redirect_to favorites_path
    end
    
    def 

    def destroy
        @user = User.find(session[:user_id])
        session.delete(:user_id)
        @user.destroy
        redirect_to login_path
    end

    private 

        def user_params
            params.require(:user).permit(:username, :password)
        end

end
