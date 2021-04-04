class Chatroom < ApplicationRecord
  validates :room_name, presence: true

  # has_many: messages
  has_many :chatroom_users
  has_many :users, through: :chatroom_users, validate: false

end
