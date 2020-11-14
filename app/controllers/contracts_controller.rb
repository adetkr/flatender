class ContractsController < ApplicationController

  def pdf_generate
    @contract = Contract.find(params[:contract_id])
    pdf_html = ActionController::Base.new.render_to_string(template: 'contracts/pdf_generate.html.erb', layout: 'pdf.html', locals: { contract: @contract, current_user: current_user })
    pdf = WickedPdf.new.pdf_from_string(pdf_html)
    send_data pdf, filename: 'votre_contrat.pdf'
  end


  def show
    @contract = Contract.find(params[:id])

  end

  def create
    @match = Match.find(params[:match_id])
    @contract = Contract.new
    @contract.match = @match
    @contract.save!
    redirect_to match_contract_path(@match, @contract.id)
  end
end
