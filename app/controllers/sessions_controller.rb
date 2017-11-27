class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/', notice: 'Successfully signed up!'
    else
      redirect_to '/signin', notice: 'Unknown username and/or password'
    end
  end

  def logout
    session.clear
    redirect_to '/signin', notice: 'Successfully logged out!'
  end

end
