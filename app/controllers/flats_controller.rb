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
     @markers = [    {
      lat: @flat.latitude,
      lng: @flat.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { flat: @flat })
    }]

  end

  def index
<<<<<<< HEAD
      @flats = Flat.all.geocoded
=======

    @flats = Flat.all.order("created_at DESC").geocoded

>>>>>>> f478f1139daafb8fca366d3785b3469b26b2c18a
    if params[:search]
      # @flats = @flats.search_by_address(params[:search][:query])
      @flats = @flats.near(params[:search][:query], 30)
    elsif params[:query]
      @flats = @flats.near(params[:query], 30)
    end
<<<<<<< HEAD
=======

>>>>>>> f478f1139daafb8fca366d3785b3469b26b2c18a

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
