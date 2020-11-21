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
    @flat_equipment = FlatEquipment.new
    @flat = Flat.find(params[:id])
     @markers = [    {
      lat: @flat.latitude,
      lng: @flat.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { flat: @flat })
    }]
  end


  def flat_equipments
    @flat = Flat.find(params[:flat_id])
    @flat.equipment_ids = equipments_params[:equipment_id]
    redirect_to @flat
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(params_flat)
    redirect_to flat_path(@flat)
  end


  def index
    search_params = params["search_flat"]
    @city_params = params[:search]
    @city_query_params = params[:query]
    if search_params
      @max_price = (search_params["max_price"] == "" ? Flat.maximum("rent") : search_params["max_price"])
      @min_price = (search_params["min_price"] == "" ? Flat.minimum("rent")  : search_params["min_price"])
      @max_surface = (search_params["max_surface"] == "" ? Flat.maximum("surface") : search_params["max_surface"])
      @min_surface = (search_params["min_surface"] == "" ? Flat.minimum("surface")  : search_params["min_surface"])
      @max_rooms = (search_params["max_rooms"] == "" ? Flat.maximum("rooms") : search_params["max_rooms"])
      @min_rooms = (search_params["min_rooms"] == "" ? Flat.minimum("rooms") : search_params["min_rooms"])
      @flats = Flat.where("rent <= ? AND rent >= ? AND surface <= ? AND surface >= ? AND rooms <= ? AND rooms >= ? ", @max_price, @min_price, @max_surface, @min_surface, @max_rooms, @min_rooms)
      if @city_params && @city_params[:query] != ""
        @flats = @flats.near(@city_params[:query], 30)
      elsif @city_query_params && @city_query_params != ""
        @flats = @flats.near(@city_query_params, 30)
      end
    else
      @flats = Flat.all.order("created_at DESC").geocoded
      if @city_params && @city_params[:query] != ""
        @flats = @flats.near(@city_params[:query], 30)
      elsif @city_query_params && @city_query_params != ""

        @flats = @flats.near(@city_query_params, 30)
      end
    end

    @markers = @flats.map do |flat|
      {
        cardId: flat.id,
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat }),
      }
    end
  end

  private

  def equipments_params
    params.require(:flat_equipment).permit(equipment_id: [])
  end

  def params_flat
    params.require(:flat).permit(:title, :address, :presentation, :rent, :surface, :rooms, photos: [])
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end

end
