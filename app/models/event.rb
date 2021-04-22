class Event < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :body
    validates :user_id
  end  
  belongs_to :user
  
end
