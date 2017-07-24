class AddCountryToDiveSites < ActiveRecord::Migration[5.1]
  def change
    add_column :dive_sites, :country, :string
  end
end
