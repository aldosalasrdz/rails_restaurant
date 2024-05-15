class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.decimal :sub_total, precision: 10, scale: 2, default: 0
      t.decimal :taxes, precision: 10, scale: 2, default: 0
      t.decimal :total, precision: 10, scale: 2, default: 0
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
