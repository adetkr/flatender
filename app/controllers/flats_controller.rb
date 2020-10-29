class FlatsController < ApplicationController


  before_action :authenticate_user! , only:  [:new, :create]

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(params_flat)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else

      render :new
    end
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def index
    @flats = Flat.all
  end

  private


  def params_flat
    params.require(:flat).permit(:title, :address, :presentation, :rent, photos: [])
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end

end
