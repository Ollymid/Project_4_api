class RemoveDiveTypeAndWaterTypeFromDiveSites < ActiveRecord::Migration[5.1]
  def change
    remove_column :dive_sites, :dive_type, :string
  end
end
