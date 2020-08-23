class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_user_path, :flash => { :error => @user.errors.full_messages }
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to root_path if !@user
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin)
    end
end
