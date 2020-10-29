class Flat < ApplicationRecord
  belongs_to :user

  has_many :flat_equipments, dependent: :destroy
  has_many :equipments, through: :flat_equipment
  has_many :likes, dependent: :destroy

  validates :user, :address, :presentation, :rent, presence: true

end
