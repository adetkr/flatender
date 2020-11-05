class Match < ApplicationRecord
  has_many :contracts, dependent: :destroy
end
