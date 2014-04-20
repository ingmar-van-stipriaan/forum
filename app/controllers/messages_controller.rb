class MessagesController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @message = current_user.messages.new(params.require(:message).permit(:content, :user_id, :topic_id))
    if @message.save
      flash[:notice] = "Bericht succesvol aangemaakt"
      redirect_to topic_path(@topic)
    else
      render("new")
    end
  end

end
