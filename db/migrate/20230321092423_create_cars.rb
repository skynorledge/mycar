class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|

      t.integer :user_id
      t.integer :maker_id
      t.integer :aero_maker_id
      t.string :title,:null => false
      t.text :body,:null => false
      t.string :maker_comment
      t.string :aero_maker_comment
      t.string :car_model,:null => false

      t.timestamps
    end
  end
end
