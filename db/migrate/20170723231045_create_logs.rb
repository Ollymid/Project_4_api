class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.date :date
      t.references :user, foreign_key: true
      t.references :dive_site, foreign_key: true
      t.string :country
      t.integer :dive_time
      t.string :gear
      t.text :comments
      t.string :visibility
      t.float :temperature
      t.string :water_type
      t.string :dive_type
      t.string :image

      t.timestamps
    end
  end
end
