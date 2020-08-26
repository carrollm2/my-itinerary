class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :is_admin?

    private
    def current_user
        user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        redirect_to root_path if !logged_in?
    end

    def is_admin?
        current_user.admin
    end

    def redirect_if_admin?
        redirect_to root_path if is_admin?
    end

end
