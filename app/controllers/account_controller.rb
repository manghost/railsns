class AccountController < ApplicationController

  def authenticate
    self.logged_in_user = User.authenticate(params[:user][:username],params[:user][:password])
    if is_logged_in?
	  flash[:notice] = "You have been logged in."
      redirect_to user_path(@logged_in_user)
    else
      flash[:alert] = "I'm sorry, either your username or password was incorrect."
      redirect_to :action => 'login'
    end  
  end
  
  def logout
    if request.post?
      reset_session
      flash[:notice] = "You have been logged out."
    end
    redirect_to users_path
  end

end
