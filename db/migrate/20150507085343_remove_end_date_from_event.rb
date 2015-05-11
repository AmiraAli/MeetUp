class RemoveEndDateFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :enddate, :date
  end
end
