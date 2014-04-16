class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:title))

    if @topic.save
      flash[:notice] = "Topic is succesvol aangemaakt"
      redirect_to(topics_path)
    else
      render("new")
    end

  end
end
