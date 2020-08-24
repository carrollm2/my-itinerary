class ItinerariesController < ApplicationController
    before_action :redirect_if_not_logged_in
 
    def new
        @itinerary = Itinerary.new
    end

    def create
        @itinerary = current_user.itineraries.build(itinerary_params)
        if @itinerary.save
            redirect_to @itinerary
        else
            render :new
        end
    end

    def show
        authorized_user_itineraries("show") 
    end


    def index
        authorized_user_itineraries("index")     
    end


    def edit
        authorized_user_itineraries("edit")     
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

    private
    def itinerary_params
        params.require(:itinerary).permit(:name, :destination_id, :event_id, :notes)
    end
end
