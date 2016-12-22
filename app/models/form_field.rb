class FormField < ActiveRecord::Base
  belongs_to :type_form_field
  belongs_to :form
end
