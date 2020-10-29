class Equipment < ApplicationRecord
  has_many :flat_equipments

  validates :name, presence: true, uniqueness: true
end
