class MessagesController < ApplicationController
  def index
    @messages = Message.sorted
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params.require(:message).permit(:content, :user_id, :topic_id))
    if @message.save
      flash[:notice] = "Bericht succesvol aangemaakt"
      redirect_to @topic
    else
      render("new")
    end
  end

  def edit
  end
end
