class ItinerariesController < ApplicationController
    before_action :redirect_if_not_logged_in, :redirect_if_admin?
    before_action :set_itinerary, only: [:update, :destroy]
    before_action :authorized_user_itinerary, only: [:show, :edit]

 
    def new
        @itinerary = Itinerary.new
    end

    def create
        @itinerary = current_user.itineraries.build(itinerary_params)
        if date_and_time_conflict?
            flash[:message] = "There is a date and time conflict with previously scheduled event in your Itinerary."
            redirect_to new_itinerary_path            
        else
            if @itinerary.save
                flash[:success] = "Successfully created Itinerary."
                redirect_to itinerary_path(@itinerary)
            else
                render :new
            end            
        end
    end

    def show
    end


    def index  
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])

            if @user == current_user
                @itineraries = current_user.itineraries.sort_by { |i | Event.find_by(id: i.event_id).event_date}
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
    end

    def update
        @itinerary.update(itinerary_params)
        flash[:success] = "Successfully updated Itinerary."
        redirect_to itinerary_path(@itinerary)
    end


    def destroy
        @itinerary.destroy
        flash[:success] = "Successfully removed Itinerary."
        redirect_to user_itineraries_path(current_user)
    end


    def selected_city
        @destination = Destination.find_by(id: params[:itinerary][:destination_id])
        @itineraries = current_user.itineraries.where(destination_id: params[:itinerary][:destination_id]).sort_by { |i | Event.find_by(id: i.event_id).event_date}   
    end


    private
    def itinerary_params
        params.require(:itinerary).permit(:name, :destination_id, :event_id, :notes)
    end  

    def date_and_time_conflict?
        selected_event = Event.find_by(id: params[:itinerary][:event_id])
        current_user.events.any? {|e| e.event_date.to_s == selected_event.event_date.to_s}
    end

    def set_itinerary
        @itinerary = Itinerary.find_by(id: params[:id])
    end

    def authorized_user_itinerary
        itinerary = Itinerary.find_by(id: params[:id])
        if current_user.itineraries.include?(itinerary)
            @itinerary = itinerary
        else
            flash[:message] = "Not authorized to see other user's itineraries"
            redirect_to root_path
        end 
    end
end
