class ChangeDatatypeCategoryIdOfPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :category_id, :string
  end
end
