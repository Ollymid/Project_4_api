class CreateDiveSites < ActiveRecord::Migration[5.1]
  def change
    create_table :dive_sites do |t|
      t.string :name
      t.string :image
      t.string :water_type
      t.string :dive_type
      t.float :lat
      t.float :lng
      t.integer :max_depth

      t.timestamps
    end
  end
end
