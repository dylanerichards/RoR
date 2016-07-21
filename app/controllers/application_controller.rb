class ApplicationController < ActionController::Base
  include Clearance::Controller

  before_filter :expire_hsts

  protect_from_forgery with: :null_session

  def expire_hsts
    response.headers["Strict-Transport-Security"] = 'max-age=0'
  end
end
