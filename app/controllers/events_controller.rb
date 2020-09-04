class EventsController < ApplicationController
    before_action :redirect_if_not_logged_in, :redirect_if_not_admin?
    before_action :set_destination
    before_action :destination_event, only: [:show, :edit]
    before_action :set_event, only: [:update, :destroy]

    def new

        if @destination
            @event = @destination.events.build
        else   
            flash[:message] = "Please select destination to associate event with"
            redirect_to destinations_path   
        end
    end 


    def create

        if params[:destination_id]

            if @destination
                @event = @destination.events.build(event_params)
 
                if @event.save
                    flash[:success] = "Successfully created event"
                    redirect_to destination_events_path(@destination)
                else
                    render :new
                end
            else
                flash[:message] = "Destination does not exist"
                redirect_to destination_events_path                    
            end
        else
            redirect_to destination_events_path         
        end
    end


    def index 
        if params[:destination_id]

            if @destination
                @events = @destination.events.sort_by { |e| e.event_date}
            else
                flash[:message] = "Destination not found"
                redirect_to root_path
            end
        else
            redirect_to destination_events_path  
        end
    end


    def show
    end


    def edit 
    end

    def update
        if params[:destination_id]

            if @destination
                if @event
                    @event.update(event_params)
                    flash[:success] = "Successfully updated event"
                    redirect_to destination_event_path(@destination, @event)      
                else
                    flash[:message] = "Event does not exist"
                    redirect_to destinations_path   
                end      
            else     
                flash[:message] = "Destination does not exist"
                redirect_to destination_events_path 
            end                               
        else
            redirect_to destination_events_path 
        end

    end


    def destroy
        if params[:destination_id]        

            if @destination
                if @event   
                    @event.destroy
                    flash[:success] = "Successfully removed event"
                    redirect_to destination_events_path(@destination, @event)
                else
                    flash[:message] = "Event does not exist"
                    redirect_to destinations_path   
                end      
            else     
                flash[:message] = "Destination does not exist"
                redirect_to destinations_path  
            end                    
        else
            redirect_to destinations_path 
        end
    end


    private
    def event_params
        params.require(:event).permit(:description, :destination_id, :ticket_site, :event_date)
    end    

    def set_destination
        @destination = Destination.find_by_id(params[:destination_id])
    end

    def set_event
        @event = @destination.events.find_by_id(params[:id])  
    end    

    def destination_event
        if params[:destination_id]
            if @destination
                @event = @destination.events.find_by_id(params[:id])
                if !@event
                    flash[:message] = "Event does not exist"
                    redirect_to destination_events_path 
                end                    
            else
                flash[:message] = "Destination does not exist"
                redirect_to destination_events_path 
            end
        else
            redirect_to destination_events_path   
        end
    end


end
