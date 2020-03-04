class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.user_id
            redirect_to user_path(user)
        else
            flash[:messages] = "Invalid login, try again."
            redirect_to login_path
        end
    end

    def destroy
        reset_session
        redirect_to login_path
    end
end
