class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :flats, dependent: :destroy
  has_one_attached :photo

  def appear(data)
    self.update(online: true, current_room: data['on'])
    ActionCable.server.broadcast "AppearanceChannel", {event: 'appear', user_id: self.id, room: self.current_room}
  end

  def self.online
    ids = ActionCable.server.pubsub.redis_connection_for_subscriptions.smembers "online"
    where(id: ids)
  end

end
