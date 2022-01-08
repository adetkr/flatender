class MessagesController < ApplicationController
    def create
      @match = Match.find(params[:match_id])
      @message = Message.new(message_params)
      @message.match = @match
      @message.user = current_user
      if @message.image.attached?
        @message.content = "Imagessnhjk"
      end
      if @message.save
        MatchChannel.broadcast_to(
          @match,
          #render_to_string(partial: "shared/received_message", locals: { message: @message, user_id: current_user.id })
          { message: render_to_string(partial: "shared/received_message", locals: { message: @message}),
            user_id: current_user.id
          }
        )
      else
        render "matches/#{@match.id}"
      end
    end

private
  def message_params
    params.require(:message).permit(:content, :match_id, :user_id, :image)
  end
end
