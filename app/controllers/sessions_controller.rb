# class SessionsController < ApplicationController
#   def home
#   end

#   def destroy
#     session.clear
#     redirect_to root_path
#   end

#   def create
#     user = User.find_by(username: params[:user][:username])
#     if user && user.authenticate(params[:user][:password])
#       session[:user_id] = user.id
#       redirect_to user_path(user)
#     else
#       flash[:message] = "incorrect login info, please try again"
#       redirect_to '/login'
#     end
#   end
# end


class SessionsController < ApplicationController

  def home   
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def create

    if auth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.username = auth['info']['name']
        u.email = auth['info']['email']
      end

      @user.save(:validate => false)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      non_auth_login
    end
  end
 
  private
 
  def auth
    request.env['omniauth.auth']
  end

  def non_auth_login
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