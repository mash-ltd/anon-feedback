class MessagesController < ApplicationController
  def index
  	@messages = Message.where(user_id: current_user.id)
  end

  def show
  	@message = Message.find params[:id]
  end

  def create
    @message = Message.new(params[:message])
    if @message.message_using_identity == '1'
      @message.sender_id = current_user.id
    end
    respond_to do |format|
      if current_user.id == @message.user_id
        @message.errors[:base] << "You cannot send a message to yourself"
        format.js
      else
        if @message.save
          format.html { redirect_to root_path, :notice => "Successfully sent message." }
          format.js { render :close_message }
        else
          format.js
        end
      end
    end
  end
end

