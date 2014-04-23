class MessagesController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @message = current_user.messages.new(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to topic_path(@topic) }
        format.js{ render 'topics/create' }
      end
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.destroy
        format.html { redirect_to topic_path(@topic) }
        format.js{ render 'topics/destroy' }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :topic_id)
  end
end
