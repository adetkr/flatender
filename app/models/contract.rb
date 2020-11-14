class Contract < ApplicationRecord
  belongs_to :match
  has_one_attached :document_pdf
end
