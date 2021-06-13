class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :category_id 
    validates :name
    validates :nickname
    validates :self_introduction
    validates :email
  end
  # フォローしているユーザーを取り出す
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships

  # フォローされているユーザーを取り出す
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users

  has_many :messages

  has_many :events

  has_many :posts, dependent: :destroy

  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end
  
  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
  # 半角英数字混合のみ
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
