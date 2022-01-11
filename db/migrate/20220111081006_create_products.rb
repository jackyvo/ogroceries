class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :supplier_id
      t.text :description
      t.string :name
      t.string :sku

      t.timestamps
    end
  end
end
