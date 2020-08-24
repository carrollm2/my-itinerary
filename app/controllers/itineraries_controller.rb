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
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])

            if @user == current_user
                @itinerary = Itinerary.find(params[:id])
            else
                flash[:message] = "Not authorized to see other user's itineraries"
                redirect_to root_path
            end
        else
            flash[:message] = "Not authorized to see other user's itineraries"
            redirect_to root_path
        end   
    end


    def index
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])

            if @user == current_user
                @itineraries = @user.itineraries
            else
                flash[:message] = "Not authorized to see other user's itineraries"
                redirect_to root_path
            end
        else
            flash[:message] = "Not authorized to see other user's itineraries"
            redirect_to root_path 
        end        
    end


    def edit
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])

            if @user == current_user
                @itinerary = Itinerary.find(params[:id])
            else
                flash[:message] = "Not authorized to see other user's itineraries"
                redirect_to root_path
            end
        else
            flash[:message] = "Not authorized to see other user's itineraries"
            redirect_to root_path 
        end          
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
