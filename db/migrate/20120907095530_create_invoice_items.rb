class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.integer :invoice_id, :null=>false
      t.decimal :quantity
      t.integer :quantity_type_id
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
