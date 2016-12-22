class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.float :price
      t.date :date
      t.references :money, index: true, foreign_key: true
      t.references :exchange_office, index: true, foreign_key: true
      t.references :price_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
