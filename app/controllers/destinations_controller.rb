class DestinationsController < ApplicationController
    before_action :redirect_if_not_logged_in, :redirect_if_not_admin?

    def new
        @destination = Destination.new
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


    private
    def destination_params
        params.require(:destination).permit(:city)
    end    

end
