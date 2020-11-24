class Message < ApplicationRecord
  belongs_to :match
  belongs_to :user
  validates :content,  presence: true
  has_one_attached :image

end
