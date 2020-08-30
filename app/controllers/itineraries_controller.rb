class ItinerariesController < ApplicationController
    before_action :redirect_if_not_logged_in, :redirect_if_admin?
 
    def new
        @itinerary = Itinerary.new
    end

    def create
        @itinerary = current_user.itineraries.build(itinerary_params)
        if !date_and_time_conflict?
            if @itinerary.save
                redirect_to itinerary_path(@itinerary)
            else
                render :new
            end
        else
            flash[:message] = "There is a date and time conflict with previously scheduled event in your Itinerary."
            redirect_to new_itinerary_path
        end
    end

    def show
        authorized_user_itinerary 
    end


    def index  
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])

            if @user == current_user
                @itineraries = current_user.itineraries
            else
                flash[:message] = "Not authorized to see other user's itineraries"
                redirect_to root_path
            end
        else
            flash[:message] = "Not authorized to itineraries of other users"
            redirect_to root_path 
        end   
    end


    def edit 
        authorized_user_itinerary
    end

    def update
        @itinerary = Itinerary.find(params[:id])
        @itinerary.update(itinerary_params)
        redirect_to itinerary_path(@itinerary)
    end


    def destroy
        @itinerary = Itinerary.find(params[:id])
        @itinerary.destroy
        redirect_to user_itineraries_path(current_user)
    end


    def selected_city
        @destination = Destination.find_by(id: params[:itinerary][:destination_id])
        @itineraries = current_user.itineraries.where(destination_id: params[:itinerary][:destination_id])   
    end


    private
    def itinerary_params
        params.require(:itinerary).permit(:name, :destination_id, :event_id, :notes)
    end  

    def date_and_time_conflict?
        selected_event = Event.find_by_id(params[:itinerary][:event_id])
        current_user.events.any? {|e| e.event_date.to_s == selected_event.event_date.to_s}
    end

    def authorized_user_itinerary
        itinerary = Itinerary.find(params[:id])
        if current_user.itineraries.include?(itinerary)
            @itinerary = itinerary
        else
            flash[:message] = "Not authorized to see other user's itineraries"
            redirect_to root_path
        end 
    end
end
