class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references    :user,                 null: false, foreign_key: true
      t.string        :product_name,         null: false
      t.text          :product_description,  null: false
      t.string        :category,             null: false
      t.string        :condition_id,            null: false
      t.string        :delivery_charge_id,      null: false
      t.string        :delivery_way_id,         null: false
      t.string        :delivery_area_id,        null: false
      t.string        :delivery_days_id,        null: false
      t.integer       :price,                null: false
      t.timestamps
    end
  end
end
