class Flat < ApplicationRecord
  belongs_to :user

  has_many :flat_equipments, dependent: :destroy
  has_many :equipments, through: :flat_equipment
  has_many :likes, dependent: :destroy

  validates :user, :address, :presentation, :rent, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
