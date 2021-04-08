class Message < ApplicationRecord
  with_options presence: true do
    validates :text
    validates :user_id
    validates :chatroom_id
  end

  belongs_to :user
  belongs_to :chatroom
end
