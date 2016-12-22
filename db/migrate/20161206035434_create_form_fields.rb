class CreateFormFields < ActiveRecord::Migration
  def change
    create_table :form_fields do |t|
      t.string :name
      t.string :value
      t.boolean :exist
      t.references :type_form_field, index: true, foreign_key: true
      t.references :form, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
