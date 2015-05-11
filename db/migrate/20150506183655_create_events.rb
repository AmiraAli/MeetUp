class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :startdate
      t.date :enddate
      t.string :city
      t.string :country
      t.string :address
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
