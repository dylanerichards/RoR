class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save!

    redirect_to root_path
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :content)
  end
end
