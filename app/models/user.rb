class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :flats, dependent: :destroy
  has_one_attached :photo

  scope :online, ->{ where("last_seen_at > ?", 70.minutes.ago)}

  def online?
    return false if last_seen_at.nil?
    last_seen_at > 70.minutes.ago
  end

end
