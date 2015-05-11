class RemoveLatitudeFromGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :latitude, :float
  end
end
