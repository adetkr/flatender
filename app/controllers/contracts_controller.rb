class ContractsController < ApplicationController

  def pdf_generate
    @contract = Contract.find(params[:contract_id])
    pdf_html = ActionController::Base.new.render_to_string(template: 'contracts/pdf_generate', layout: 'pdf')
    pdf = WickedPdf.new.pdf_from_string(pdf_html)
    send_data pdf, filename: 'votre_contrat.pdf'
    # FileUtils.mkdir_p "#{Rails.root}/tmp/contracts"
    # dir = Rails.root.join('tmp', 'contracts')
    # file = File.open(dir.join('file.pdf'), 'w+')
    # file.binmode
    # file.write(pdf)
  end


  def show
    @contract = Contract.find(params[:id])
    # pdf_html = ActionController::Base.new.render_to_string(template: 'contracts/show', layout: 'pdf')
    # pdf = WickedPdf.new.pdf_from_string(pdf_html)
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     render pdf: "#{@contract.id}",
    #     template: "contracts/show.html.erb",
    #     layout: 'pdf.html'
    #   end
    # end
  end

  def create
    @match = Match.find(params[:match_id])
    @contract = Contract.new
    @contract.match = @match
    @contract.save!
    redirect_to match_contract_path(@match, @contract.id)
  end
end
