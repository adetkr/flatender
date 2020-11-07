class MatchesController < ApplicationController

  def show
    @matchs = Match.all
    @match = Match.find(params[:id])
    @message = Message.new()
  end

end
