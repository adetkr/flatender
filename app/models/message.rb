class Message < ApplicationRecord
  belongs_to :match
  belongs_to :user
  has_one_attached :image
end
