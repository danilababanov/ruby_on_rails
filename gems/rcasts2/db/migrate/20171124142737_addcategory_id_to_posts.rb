class AddcategoryIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :category_id, :integer
  end
end
