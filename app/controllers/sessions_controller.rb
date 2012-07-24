class SessionsController < ApplicationController
  protect_from_forgery
  include SessionsHelper

  def new
  end

  def create
     user = User.find_by_email(params[:session][:email])
     if user && User.authenticate(params[:session][:email],params[:session][:password])
     #if user && user.authenticate(params[:session][:password])
       sign_in user
       redirect_to user
     else
       flash.now[:error] = 'Invalid email/password combination'
       render 'new'
     end
   end

  def destroy
  end
end
