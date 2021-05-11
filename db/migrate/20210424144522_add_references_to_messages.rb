class AddReferencesToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :user, null: false, foreign_key: true
    add_reference :messages, :chatroom, null: false, foreign_key: true
  end
end
