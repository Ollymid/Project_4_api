class AddDiveTypeToDiveSites < ActiveRecord::Migration[5.1]
  def change
    add_column :dive_sites, :dive_type, :string
  end
end
