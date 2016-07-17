class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :null_session
end
