class CreateDishes < ActiveRecord::Migration[7.1]
  def change
    create_table :dishes do |t|
      t.string :dish_group
      t.string :name
      t.text :description
      t.decimal :price, precision: 5, scale: 2
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
