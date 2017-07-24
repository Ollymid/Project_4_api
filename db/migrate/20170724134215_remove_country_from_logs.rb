class RemoveCountryFromLogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :logs, :country, :string
  end
end
