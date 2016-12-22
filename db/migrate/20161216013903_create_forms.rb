class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :name
      t.string :name_form

      t.timestamps null: false
    end
  end
end
