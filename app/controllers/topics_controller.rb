class TopicsController < ApplicationController
  
  before_action :set_topic
  skip_before_action :set_topic, only: [:index, :new, :create]
  
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def show
  end

  def edit 
  end

  def update
    @topic.update_attributes(topic_params)

    redirect_to @topic
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save!

    redirect_to root_path
  end

  def destroy
    @topic.destroy

    redirect_to root_path
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :content)
  end

  def set_topic
    @topic = Topic.friendly.find(params[:id])
  end
end
