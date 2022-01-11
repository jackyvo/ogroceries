class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.string :url
      t.string :vat
      t.string :iban
      t.string :bic

      t.timestamps
    end
  end
end
