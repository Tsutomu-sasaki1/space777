class Post < ApplicationRecord

  with_options presence: true do
    validates :category_id
    validates :title
    validates :text
    validates :user_id
  end
  belongs_to :user
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  # 検索条件 後ほど検索条件変更する
  def self.search(search)
    if search != ""
      Post.where('text LIKE ? ', "%#{search}%").
        or(where(" category_id LIKE ?", "%#{search}%")).
        or(where(" title LIKE ?", "%#{search}%"))
    else
      Post.all
    end
  end

end
# , numericality: { other_than: 0 }