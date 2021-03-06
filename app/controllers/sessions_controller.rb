class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Signed in"
    else
      redirect_to signin_path, :notice => 'Invalid username or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to signin_path, :notice => 'Logged out'
  end
end