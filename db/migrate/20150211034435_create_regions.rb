class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.string :style
      t.integer :quadrant_id
      t.string :year

      t.timestamps null: false
    end
  end
end
