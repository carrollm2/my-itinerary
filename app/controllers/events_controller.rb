class EventsController < ApplicationController


    def new
        @destination = Destination.find_by_id(params[:destination_id])

        if @destination
            @event = @destination.events.build
        else
            flash[:message] = "destination does not exist"
            redirect_to destinations_path            
        end
    end 


    def create
        destination = Destination.find_by_id(params[:destination_id])

        @event = destination.events.build(event_params).save
 
        if @event
            redirect_to destination_path(destination)
        else
            render :new
        end
    end


    def index 
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])

            if @user
                @events = @user.events
            else
                flash[:message] = "not authorized to see other user's events"
                redirect_to root_path
            end
        end
    end

    private
    def event_params
        params.require(:event).permit(:description, :destination_id, :ticket_site, :event_date)
    end    

end
