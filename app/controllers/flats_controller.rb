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
    @flats = Flat.all.order("created_at DESC").geocoded

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat }),
      }
    end
  end

  private


  def params_flat
    params.require(:flat).permit(:title, :address, :presentation, :rent, photos: [])
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end

end
