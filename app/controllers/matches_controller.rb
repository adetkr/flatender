class MatchesController < ApplicationController

  def show
    @matchs = Match.all
  end
end
