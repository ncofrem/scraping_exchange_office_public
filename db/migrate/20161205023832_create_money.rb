class CreateMoney < ActiveRecord::Migration
  def change
    create_table :money do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
