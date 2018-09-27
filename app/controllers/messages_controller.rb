class MessagesController < ApplicationController

  def new
    @message = Message.new(read: "false")
  end

  def create
    @message = Message.create!(message_params)
    #Do some send action
  end

  private

  def message_params
    params.require(:message).permit(:title, :content)
  end
end
