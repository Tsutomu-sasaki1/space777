class ChangeDatatypeCategoryIdOfUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :category_id, :string
  end
end
