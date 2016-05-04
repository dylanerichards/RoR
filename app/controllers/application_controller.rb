class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_topic

  private
  
  def set_topic
    @topic = Topic.friendly.find(params[:id])
  end
end
