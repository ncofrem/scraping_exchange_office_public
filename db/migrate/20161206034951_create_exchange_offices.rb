class CreateExchangeOffices < ActiveRecord::Migration
  def change
    create_table :exchange_offices do |t|
      t.string :name
      t.string :url_page
      t.boolean :scraping_done
      t.references :message, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
