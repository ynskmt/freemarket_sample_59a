class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string     :last_name,         null: false
      t.string     :first_name,        null: false
      t.string     :last_name_kana,    null: false
      t.string     :first_name_kana,   null: false
      t.integer    :zip_code,          null: false
      t.string     :prefecture_id,        null: false
      t.string     :city,              null: false
      t.string     :block_num,         null: false
      t.string     :building_name
      t.integer    :phone_num
      t.references :user,              null:false, foeighn_key:true
      t.timestamps
    end
  end
end
