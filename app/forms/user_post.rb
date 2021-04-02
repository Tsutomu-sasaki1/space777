# class UserPost
#   include ActiveModel::Model
#   attr_accessor :title, :text, :category_id, :image, :name, :nickname, :encrypted_password, :email, :self_introduction, :user_id

#   with_options presence: true do
#     validates :category_id, numericality: { other_than: 0 }
#     validates :name
#     validates :nickname
#     validates :self_introduction
#     validates :title
#     validates :text
#     validates :user_id
#   end

#   def save
#     user = User.create!(nickname: nickname, name: name, self_introduction: self_introduction, category_id: category_id )
#     Post.create!( title: title, text: text, category_id: category_id, image: image, user_id: user_id )
#   end
# end