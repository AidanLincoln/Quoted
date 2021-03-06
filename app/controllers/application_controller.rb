class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    def login_user(user)
        session[:user_id] = user.id
    end
    def current_user
        if session[:user_id]
            User.find_by(id:session[:user_id])
        else 
            nil
        end
    end
    def logged_in?
        !!current_user
    end
    def authorized
        unless logged_in?
            flash[:notice] = "You must be logged in to access this feature."
            redirect_to login_path
        end
    end
end
