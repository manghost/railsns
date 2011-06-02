class ApplicationController < ActionController::Base
  protect_from_forgery

  session :session_key => '_railsns_seesion_id'

  include LoginSystem
end
