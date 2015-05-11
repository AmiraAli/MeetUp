class AddLongitudeToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :longitude, :string
  end
end
