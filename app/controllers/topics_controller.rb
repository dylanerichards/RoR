class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.friendly.find(params[:id])
  end

  def edit
    @topic = Topic.friendly.find(params[:id])
  end

  def update
    topic = Topic.friendly.find(params[:id])
    topic.update_attributes(topic_params)

    redirect_to topic
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save!

    redirect_to root_path
  end

  def destroy
    @topic = Topic.friendly.find(params[:id])
    @topic.destroy

    redirect_to root_path
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :content)
  end
end
