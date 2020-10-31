class FlatsController < ApplicationController

def show
  @flat = Flat.find(params[:id])
end
def index
    @flats = Flat.all

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat })

      }
    end
end
end
