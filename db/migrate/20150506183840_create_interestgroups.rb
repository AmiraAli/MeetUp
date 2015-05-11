class CreateInterestgroups < ActiveRecord::Migration
  def change
    create_table :interestgroups do |t|
      t.references :interest, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
