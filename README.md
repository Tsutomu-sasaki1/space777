# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  ruby 2.6.5
  Rails 6.0.3.5

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# README

# テーブル設計

## users テーブル

| Column              | Type          | Options                       |
| ------------------- | ------------- | ----------------------------- |
| name                | string        | null: false                   |
| nickname            | string        | null: false                   |
| encrypted_password  | string        | null: false                   |
| email               | string        | null: false, unique: true     |
| self_introduction   | string        | null: false                   |
| category_id         | integer       | null: false                   |
### Association
- has_many : post_likes, dependent: :destroy
- has_many : posts, through: :post_likes, source: :post, dependent: :destroy 

- has_many : message_likes, dependent: :destroy
- has_many : messages, through: :comment_likes, source: :comment

- has_many : user_communities
- has_many : communities, through: :user_communities

- has_many : chatroom_users, dependent: :destroy
- has_many : chatrooms, through: chatroom_users

- has_many : follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # Relationshipモデルのfollower_idにuser_idを格納(フォロー取得)
- has_many : followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # Relationshipモデルのfollowed_idにuser_idを格納(フォロワー取得)
- has_many :following_user, through: :follower, source: :followed #自分がフォローしているユーザー
- has_many :follower_user, through: :followed, source: :follower #自分をフォローしているユーザー

## posts テーブル

| Column              | Type          | Options                       |
| ------------------- | ------------- | ------------------------------|
| title               | string        | null: false                   |
| text                | string        | null: false                   |
| category_id         | integer       | null: false                   |
| user_id             | integer       | null: false                   |
| image               | text          | null: false                   |

### Association
- has_many : post_likes
- has_many : users, through: post_likes, source: :user, dependent: :destroy

- has_many : images
- has_many : messages
- belongs_to : user

## chatrooms テーブル
| Column              | Type          | Options                        |
| ------------------- | ------------- | ------------------------------ |
<!-- | user_id             | references    | null: false, foreign_key: true | -->
### Association
- has_many : messages

- has_many :user_chats
- has_many :users, through: :user_chats, source: :user

## messages テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment      | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| post_id      | references | null: false, foreign_key: true |
| chatroom_id  | references | null: false, foreign_key: true |
| community_id | references | null: false, foreign_key: true |
### Association
- has_many :message_likes
- has_many :users, through: :comment_likes, source: :user

- belongs_to : post
- belongs_to : chat
- belongs_to : community

## communities テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| message_id   | references | null: false, foreign_key: true |
### Association
- has_many : messages

- has_many : user_communities
- has_many : users, through: :user_communities, source: :user

## relationship テーブル(中間)
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| follower_id  | integer    | null: false, foreign_key: true |
| follower_id  | integer    | null: false, foreign_key: true |
### Association
- has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得(フォローする人)
- has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得(フォローされる人)
- belongs_to :follower, class_name: "User"
- belongs_to :followed, class_name: "User"

## user_communities テーブル(中間)
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| community_id | references | null: false, foreign_key: true |
### Association
- belongs_to :community
- belongs_to :user

## post_likes テーブル(中間)
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| post_id      | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :post

## comment_likes テーブル(中間)
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| comment_id   | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :message

## chatroom_users テーブル(中間)
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| chatroom_id      | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :chatroom

## event テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| event_title  | string     | null: false                    |
| body         | references | null: false, foreign_key: true |
| disp_flg     | references | null: false, foreign_key: true |
| start        | references | null: false, foreign_key: true |
| end          | references | null: false, foreign_key: true |
| user_id      |            | null: false, foreign_key: true |
| allday       | references |                                |