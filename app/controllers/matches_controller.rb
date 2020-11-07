class MatchesController < ApplicationController
  def index
    @matchs = []
    @match = nil
    current_user.flats.each do |flat|
      flatmatchs = FlatMatch.where(flat_id: flat.id)
      flatmatchs.each do |flatmatch|
        @matchs << Match.find(flatmatch.match.id)
      end

    end
    render :show
  end
  def show
    @matchs = []
    current_user.flats.each do |flat|
      flatmatchs = FlatMatch.where(flat_id: flat.id)
      flatmatchs.each do |flatmatch|
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
