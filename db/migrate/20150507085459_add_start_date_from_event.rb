class AddStartDateFromEvent < ActiveRecord::Migration
  def change
    add_column :events, :startdate, :datetime
  end
end
