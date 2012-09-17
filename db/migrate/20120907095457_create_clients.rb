class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :user_id, :null=>false
      t.string :name
      t.string :website

      t.timestamps
    end
  end
end
