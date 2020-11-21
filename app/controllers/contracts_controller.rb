class ContractsController < ApplicationController

  def pdf_generate
    @contract = Contract.find(params[:contract_id])
    pdf_html = ActionController::Base.new.render_to_string(template: 'contracts/pdf_generate.html.erb', layout: 'pdf.html', locals: { contract: @contract, current_user: current_user })
    pdf = WickedPdf.new.pdf_from_string(pdf_html)

    pdf_path = Rails.root.join("tmp", "Contract-#{@contract.id}.pdf")
    File.open(pdf_path, "wb") do |file|
      file << pdf
    end


    @contract.document_pdf.attach(io: File.open(pdf_path), filename: "Contract-#{@contract.id}.pdf", content_type: 'application/pdf')
    @contract.save!

    send_enveloppe(@contract, pdf_path.to_s)

    File.delete(pdf_path) if File.exist?(pdf_path)

    send_data pdf, filename: 'votre_contrat.pdf'
  end

  def send_enveloppe(contract, pdf_path)

  client = DocusignRest::Client.new
  document_envelope_response = client.create_envelope_from_document(
    email: {
      subject: "Flatender",
      body: "Please Sign your Flatender Contract!"
    },
    # If embedded is set to true in the signers array below, emails
    # don't go out to the signers and you can embed the signature page in an
    # iframe by using the client.get_recipient_view method
    signers: [
      {
        embedded: true,
        routing_order: '0',
        name: contract.match.flat1.user.name,
        email: contract.match.flat1.user.email,
        role_name: 'issuer',
        sign_here_tabs: [
          {
            anchor_string: 'Signature1',
            anchor_x_offset: '-30',
            anchor_y_offset: '35'
          }
        ]
      },
    {
        embedded: true,
        routing_order: '1',
        name: contract.match.flat2.user.name,
        email: contract.match.flat2.user.email,
        role_name: 'issuer',
        sign_here_tabs: [
          {
            anchor_string: 'Signature2',
            anchor_x_offset: '-30',
            anchor_y_offset: '35'
          }
        ]
      }

    ],
    files: [
      {path: pdf_path, name: "Contract-#{contract.id}.pdf"},
    ],
    status: 'sent'
  )
   contract.enveloppe_id = document_envelope_response['envelopeId']
   contract.save!


  end

  def sign_contract
    @contract = Contract.find(params[:contract_id])
    client = DocusignRest::Client.new
    url = client.get_recipient_view(envelope_id: @contract.enveloppe_id, name: current_user.name, email: current_user.email, return_url: "#{ENV['ROOT_URL']}/docusign/callback")['url']
    @contract.update(signature: DateTime.now)
    redirect_to url
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
