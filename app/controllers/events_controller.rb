class EventsController < ApplicationController

    def index 
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])

            if @user
                @events = @user.events
            else
                @error = "That user does not exist"
                @events = Event.all
            end
        else
            @events = Event.all
        end
    end

end
