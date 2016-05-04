class TopicsController < ApplicationController
  def index
  end

  def new
    @topic = Topic.new
  end
end
