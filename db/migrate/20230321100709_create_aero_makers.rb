class CreateAeroMakers < ActiveRecord::Migration[6.1]
  def change
    create_table :aero_makers do |t|

      t.string :aero_maker_name

      t.timestamps
    end
  end
end
