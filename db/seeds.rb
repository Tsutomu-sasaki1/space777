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
    title: "タイトル#{n + 1}",
    text: "テキスト#{n + 1}です",
    category_id: "#{n + 1}",
    user_id: "#{n + 1}",
    images: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/test_image/test#{n + 1}.jpg")), filename: "test#{n + 1}.jpg")
  )
end
