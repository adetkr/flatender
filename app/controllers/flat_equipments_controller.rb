class FlatEquipmentsController < ApplicationController

  def new
    @flat_equipment = FlatEquipment.new
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @flat_equipment = FlatEquipment.new(params_flat_equipment)
    @flat_equipment.flat = @flat

    if @flat_equipment.save!
      redirect_to flat_path(@flat)
    else
      render "flats/show"
    end
  end

  def destroy
    @flat_equipment = FlatEquipment.find(params[:id])
    @flat_equipment.destroy
    redirect_to flat_path(@flat)
  end


  private

    def params_flat_equipment
      params.require(:flat_equipment).permit(:name, :equipment_id)
    end
end
