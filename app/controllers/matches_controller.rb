class MatchesController < ApplicationController

  def show
    @matchs = []
    current_user.flats.each do |flat|
      flatmatch = FlatMatch.find_by(flat_id: flat.id)
      if flatmatch != nil
      @matchs << Match.find(flatmatch.match.id)
      end
    end


    @match = Match.find(params[:id])
    if @match.flat1.user == current_user
      @flat = @match.flat2
      @user = @flat.user
    else
      @flat = @match.flat1
      @user = @flat.user
    end
    @message = Message.new()
  end
end
