class TopicsController < ApplicationController

  before_action :authenticate_user!
  before_action :unless_current_user, :only => [:edit, :update, :delete, :destroy]

  def index
    @topics = TopicDecorator.decorate_collection(Topic.order("created_at DESC"))
  end

  def show
    @topic = Topic.find(params[:id]).decorate
    @message = Message.new( :topic => @topic, :user_id => current_user )
  end

  def new
    @topic = Topic.new( :user_id => current_user.id )
  end

  def create
    
    @topic = Topic.new(params.require(:topic).permit(:title, :description, :user_id))

    if @topic.save
      flash[:notice] = "Topic is succesvol aangemaakt"
      redirect_to(topics_path)
    else
      render("new")
    end

  end

  def edit
  end

  def update 
    if @topic.update_attributes(params.require(:topic).permit(:title, :description, :user_id))
      flash[:notice] = "Topic is succesvol aangepast"
      redirect_to(topics_path)
    else
      render("edit")
    end
  end

  def destroy
    @topic = Topic.find(params[:id]).destroy
    redirect_to topics_path
  end

  private

  def unless_current_user
    @topic = Topic.find(params[:id])
    redirect_to(topics_path) unless current_user.id == @topic.user.id 
  end

end
