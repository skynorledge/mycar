class CreatePostTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tags do |t|

      t.integer :tag_id
      t.integer :car_id

      t.timestamps
    end
  end
end
