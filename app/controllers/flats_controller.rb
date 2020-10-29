class FlatsController < ApplicationController

  before_action :authenticate_user! , only:  [:new, :create]

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(params_flat)
    @flat.user = current_user
    if @flat.save
      redirect_to root_path
    else

      render :new
    end
  end

  private


  def params_flat
    params.require(:flat).permit(:address, :presentation, :rent, photos: [])
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
