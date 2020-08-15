class ItinerariesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
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
        @itinerary = Itinerary.find(params[:id])
    end

    private
    def itinerary_params
        params.require(:itinerary).permit(:name, :destination_id, :notes)
    end
end
