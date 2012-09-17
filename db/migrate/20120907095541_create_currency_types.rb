class CreateCurrencyTypes < ActiveRecord::Migration
  def change
    create_table :currency_types do |t|
      t.string :symbol
      t.string :code

      t.timestamps
    end
  end
end
