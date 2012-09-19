class AddIndexes < ActiveRecord::Migration
  def change
    add_index :invoices, :user_id
    add_index :invoices, :client_id
    add_index :invoices, :currency_type_id
    add_index :contacts, :client_id
    add_index :clients, :user_id
    add_index :invoice_items, :invoice_id
    add_index :invoice_items, :quantity_type_id
    add_index :profiles, :user_id
    add_index :addresses, :addressable_id
    add_index :addresses, :addressable_type
  end
end
