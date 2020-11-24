class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def myflats
    @flats = Flat.where(user: current_user)
          @matchs = []
    @match = nil
    current_user.flats.each do |flat|
      flatmatchs = FlatMatch.where(flat_id: flat.id)
      flatmatchs.each do |flatmatch|
        @matchs << Match.find(flatmatch.match.id)
      end
    end
  end



  def callback
    utility = DocusignRest::Utility.new

    @response = params[:event]
    if params[:event] == "signing_complete"
      flash[:notice] = "Thanks! Successfully signed"


    else
      flash[:notice] = "You chose not to sign the document."
    end

    @flat = current_user.flats.last
    @matches = []
    @flat.flat_matches.map do |flat|
      @matches << flat.match_id
    end

    @signed_contracts = []
    @matches.map do |match|
      cont = Contract.order(signature: :desc)
      @signed_contracts << cont.where("match_id = #{match}").first
    end

    @last_signed_contracts = @signed_contracts.first


    if @last_signed_contracts && @last_signed_contracts.match.flat1.user == current_user
       @current_user_flat = @last_signed_contracts.match.flat1
       @other_user_flat = @last_signed_contracts.match.flat2
    elsif @last_signed_contracts
      @current_user_flat = @last_signed_contracts.match.flat2
      @other_user_flat = @last_signed_contracts.match.flat1
    else
      @error = true
    end
end

  def initiate

  client = DocusignRest::Client.new
  document_envelope_response = client.create_envelope_from_document(
    email: {
      subject: "test email subj ect",
      body: "this is the email body and it's large!"
    },
    # If embedded is set to true in the signers array below, emails
    # don't go out to the signers and you can embed the signature page in an
    # iframe by using the client.get_recipient_view method
    signers: [
      {
        embedded: true,
        name: 'Jane Dimaggio',
        email: 'jane.dimaggio@examle.org',
        role_name: 'issuer',
        sign_here_tabs: [
          {
            anchor_string: 'tou',
            anchor_x_offset: '-30',
            anchor_y_offset: '35'
          }
        ]
      },

    ],
    files: [
      {path: 'testb.pdf', name: 'testb.pdf'},
    ],
    status: 'sent'
  )
   url = client.get_recipient_view(envelope_id: document_envelope_response['envelopeId'], name: 'Jane Dimaggio', email: 'jane.dimaggio@examle.org', return_url: 'http://localhost:3000/docusign/callback')['url']

   redirect_to url

  end
end
