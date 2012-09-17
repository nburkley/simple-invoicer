class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :user_id, :null=>false
      t.integer :client_id
      t.date :date
      t.integer :number
      t.integer :currency_type_id
      t.text :note

      t.timestamps
    end
  end
end
