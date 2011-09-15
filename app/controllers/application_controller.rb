class ApplicationController < ActionController::Base
  protect_from_forgery
#  session :session_key => '_railsns_seesion_id'

  include LoginSystem
  helper_method :is_logged_in?, :logged_in_user


  
end
