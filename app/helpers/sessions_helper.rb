module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
  end

  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
   end

  def destroy
    sign_out
    redirect_to root_path
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
end
