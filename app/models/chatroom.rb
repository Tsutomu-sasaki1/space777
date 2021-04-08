class Chatroom < ApplicationRecord
  validates :room_name, presence: true

  has_many :chatroom_users
  has_many :users, through: :chatroom_users, validate: false
  has_many :messages
end
