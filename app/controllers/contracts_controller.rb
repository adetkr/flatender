class ContractsController < ApplicationController
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{params[:matches_id]}_contract"   # Excluding ".pdf" extension.
      end
    end
  end
end
