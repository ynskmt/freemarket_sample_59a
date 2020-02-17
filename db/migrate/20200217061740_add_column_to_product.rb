class AddColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :selling_status_id, :string, null: false
  end
end
