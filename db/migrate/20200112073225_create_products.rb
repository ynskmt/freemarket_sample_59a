class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references    :user,                 null: false, foreign_key: true
      t.string        :product_name,         null: false
      t.text          :product_description,  null: false
      t.string        :category,             null: false
      t.string        :condition,            null: false
      t.string        :delivery_charge,      null: false
      t.string        :delivery_way,         null: false
      t.string        :delivery_area,        null: false
      t.string        :delivery_days,        null: false
      t.integer       :price,                null: false
      t.timestamps
    end
  end
end
