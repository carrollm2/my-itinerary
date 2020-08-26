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


    def edit 
        @destination = Destination.find(params[:id])
    end

    def update
        @destination = Destination.find(params[:id])
        @destination.update(destination_params)
        redirect_to destination_path(@destination)
    end


    def destroy
        @destination = Destination.find(params[:id])
        @destination.destroy
        redirect_to destinations_path(@destination)
    end


    private
    def destination_params
        params.require(:destination).permit(:city)
    end    

end
