class ContractsController < ApplicationController
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "test_contract",
        template: "contracts/show.html.erb",
        layout: 'pdf.html.erb'
      end
    end
  end

  def create
  end
end
