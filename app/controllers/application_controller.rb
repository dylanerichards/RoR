class ApplicationController < ActionController::Base
  include Clearance::Controller

  protect_from_forgery with: :null_session

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'rubyonrichards' && password == 'thisisnotcool'
    end
  end
end
