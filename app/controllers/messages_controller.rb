class MessagesController < ApplicationController
    def create

      @match = Match.find(params[:match_id])
      @message = Message.new(message_params)
      @message.match = @match
      @message.user = current_user
      if @message.save
        MatchChannel.broadcast_to(
          @match,
          render_to_string(partial: "shared/received_message", locals: { message: @message })
        )
        redirect_to match_path(@match, anchor: "message-#{@message.id}")
      else
        render "matches/#{@match.id}"
      end
    end

private
  def message_params
    params.require(:message).permit(:content, :match_id, :user_id)
  end
end
