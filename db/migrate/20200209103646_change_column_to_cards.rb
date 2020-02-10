class ChangeColumnToCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :card_num, :integer
    remove_column :cards, :security_code, :integer
    add_column :cards, :customer_id, :string, null: false
    add_column :cards, :card_id, :string, null: false
    add_column :cards, :card_num, :string, null: false
  end
end
