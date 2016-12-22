class CreateTypeFormFields < ActiveRecord::Migration
  def change
    create_table :type_form_fields do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
