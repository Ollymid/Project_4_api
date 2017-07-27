class AddUserToDiveSites < ActiveRecord::Migration[5.1]
  def change
    add_reference :dive_sites, :user, foreign_key: true
  end
end
