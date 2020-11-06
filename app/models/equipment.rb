class Equipment < ApplicationRecord
  has_many :flat_equipments, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
