class RemoveStartDateFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :startdate, :date
  end
end
