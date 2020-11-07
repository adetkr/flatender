class Match < ApplicationRecord

  has_many :contracts, dependent: :destroy
  has_many :messages
end
