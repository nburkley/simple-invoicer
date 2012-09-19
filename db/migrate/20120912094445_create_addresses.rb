class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :addressable, :polymorphic => true
      t.string :line_one
      t.string :line_two
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country

      t.timestamps
    end
  end
end
