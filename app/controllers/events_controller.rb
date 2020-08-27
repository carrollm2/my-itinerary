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

        if params[:destination_id]
            @destination = Destination.find_by_id(params[:destination_id])

            if @destination
                @event = @destination.events.build(event_params)
 
                if @event.save
                    redirect_to destination_events_path(@destination)
                else
                    render :new
                end
            else
                flash[:message] = "destination does not exist"
                redirect_to destinations_path                    
            end
        else
            flash[:message] = "please select destination to associate with event"
            redirect_to destinations_path         
        end
    end


    def index 
        if params[:destination_id]
            @destination = Destination.find_by_id(params[:destination_id])

            if @destination
                @events = @destination.events
            else
                flash[:message] = "destination not found"
                redirect_to root_path
            end
        end
    end

    def show
        if params[:destination_id]
            @destination = Destination.find_by_id(params[:destination_id])
            @event = @destination.events.find_by_id(params[:id])
        end
    end


    def edit 
        if params[:destination_id]
            @destination = Destination.find_by_id(params[:destination_id])
            @event = @destination.events.find_by_id(params[:id])            
        end
    end

    def update
        if params[:destination_id]
            @destination = Destination.find_by_id(params[:destination_id])
            @event = @destination.events.find_by_id(params[:id])      
            @event.update(event_params)
            redirect_to destination_event_path(@destination, @event)      
        end

    end


    def destroy
        if params[:destination_id]        
            @destination = Destination.find_by_id(params[:destination_id])
            @event = @destination.events.find_by_id(params[:id])         
            @event.destroy
            redirect_to destination_events_path(@destination, @event)
        end
    end




    private
    def event_params
        params.require(:event).permit(:description, :destination_id, :ticket_site, :event_date)
    end    

end
