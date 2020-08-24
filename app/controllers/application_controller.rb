class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :is_admin?, :get_user_itinerary

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

    def authorized_user_itineraries(action)
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])

            if @user == current_user
                if action == "index"
                    @itineraries = @user.itineraries
                else
                    @itinerary = Itinerary.find(params[:id])
                end
            else
                flash[:message] = "Not authorized to see other user's itineraries"
                redirect_to root_path
            end
        else
            flash[:message] = "Not authorized to see other user's itineraries"
            redirect_to root_path 
        end   
    end
end
