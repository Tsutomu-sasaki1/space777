class Post < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :text
    validates :category_id, numericality: { other_than: 0 }
    validates :user_id
  end
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end