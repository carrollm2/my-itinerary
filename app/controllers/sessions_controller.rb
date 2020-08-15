class SessionsController < ApplicationController
  def home
  end

  def destroy
    binding.pry
    session.clear
    redirect_to root_path
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "incorrect login info, please try again"
      redirect_to '/login'
    end
  end
end
