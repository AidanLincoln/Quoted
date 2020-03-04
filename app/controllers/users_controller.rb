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
        redirect_to @user
    end

    def show
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(session[:user_id])
        @user.destroy
        redirect_to login_path
    end

    private 

        def user_params
            params.require(:user).permit(:username, :password)
        end

end
