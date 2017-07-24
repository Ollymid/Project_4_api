class RemoveDiveTypeAndWaterTypeFromLogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :logs, :dive_type, :string
    remove_column :logs, :water_type, :string
  end
end
