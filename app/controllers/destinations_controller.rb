class DestinationsController < ApplicationController

    def new
    end

    def create
        @destination = Destination.new(destination_params)
        if @destination.save
            redirect_to @destination
        else
            render :new
        end        
    end


    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find_by_id(params[:id])
    end



    def index
        @destinations = Destination.all
    end

    private
    def destination_params
        params.require(:destination).permit(:city)
    end    

end
