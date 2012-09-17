class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :client_id, :null=>false
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
