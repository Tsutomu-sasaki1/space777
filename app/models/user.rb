class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   with_options presence: true do
    validates :category_id, numericality: { other_than: 0 }
    validates :name
    validates :nickname
    validates :self_introduction
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  # 半角英数字混合のみ
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
