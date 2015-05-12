class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :interestname
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
