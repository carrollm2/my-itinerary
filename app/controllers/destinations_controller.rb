class DestinationsController < ApplicationController
    before_action :redirect_if_not_logged_in, :redirect_if_not_admin?
    before_action :set_destination, only: [:show, :edit, :update, :destroy]

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
    end


    def edit 
    end

    def update
        @destination.update(destination_params)
        redirect_to destination_path(@destination)
    end


    def destroy
        @destination.destroy
        redirect_to destinations_path(@destination)
    end


    private
    def destination_params
        params.require(:destination).permit(:city)
    end    

    def set_destination
        @destination = Destination.find_by_id(params[:id])
    end

end
