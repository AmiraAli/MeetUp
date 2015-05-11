class AddLatitudeToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :latitude, :string
  end
end
