class CreateScrapings < ActiveRecord::Migration
  def change
    create_table :scrapings do |t|
      t.string :scraping
      t.integer :position
      t.references :exchange_office, index: true, foreign_key: true
      t.references :money, index: true, foreign_key: true
      t.references :form, index: true, foreign_key: true
      t.references :price_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
