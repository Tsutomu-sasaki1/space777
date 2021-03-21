# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  User.create!(
    email: "sample-#{n + 1}@example.com",
    name: Faker::Name.name,
    nickname: "テスト#{n + 1}",
    password: "d123456#{n + 1}",
    self_introduction: "テスト#{n + 1}です",
    category_id: "#{n + 1}"
  )
end

5.times do |n|
  Post.create!(
    title: "風景#{n + 1}",
    text: "絵画#{n + 1}です",
    category_id: "#{n + 1}",
    user_id: "#{n + 1}",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/test_image/test#{n + 1}.jpg")), filename: "test#{n + 1}.jpg")
  )
end
#  post1 = Post.create({title: "風景", text: "絵画です", category_id: "1", user_id: "1", image: open("#{Rails.root}/db/test_image/test1.jpg")})
#  post2 = Post.create({title: "彫像", text: "造形です", category_id: "2", user_id: "2", image: open("#{Rails.root}/db/test_image/test2.jpg")})
#  post3 = Post.create({title: "街並み", text: "写真です", category_id: "3", user_id: "3", image: open("#{Rails.root}/db/test_image/test3.jpg")})
#  post4 = Post.create({title: "ドキュメント", text: "映像です", category_id: "4", user_id: "4", image: open("#{Rails.root}/db/test_image/test4.jpg")})