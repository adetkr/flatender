class Flat < ApplicationRecord
  belongs_to :user

  has_many :flat_matches, dependent: :destroy
  has_many :flat_equipments, dependent: :destroy
  has_many :equipments, through: :flat_equipments
  has_many :likes, dependent: :destroy

  validates :user, :address, :presentation, :rent, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
