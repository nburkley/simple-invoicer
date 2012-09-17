class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id, :null=>false
      t.string :name
      t.string :company_name
      t.string :website

      t.timestamps
    end
  end
end
