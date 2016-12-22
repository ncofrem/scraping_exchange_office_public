class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :mesagge
      t.date :date

      t.timestamps null: false
    end
  end
end
