require 'test_helper'

class FormFieldsControllerTest < ActionController::TestCase
  setup do
    @form_field = form_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_field" do
    assert_difference('FormField.count') do
      post :create, form_field: { exist: @form_field.exist, form_id: @form_field.form_id, name: @form_field.name, type_form_field_id: @form_field.type_form_field_id, value: @form_field.value }
    end

    assert_redirected_to form_field_path(assigns(:form_field))
  end

  test "should show form_field" do
    get :show, id: @form_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_field
    assert_response :success
  end

  test "should update form_field" do
    patch :update, id: @form_field, form_field: { exist: @form_field.exist, form_id: @form_field.form_id, name: @form_field.name, type_form_field_id: @form_field.type_form_field_id, value: @form_field.value }
    assert_redirected_to form_field_path(assigns(:form_field))
  end

  test "should destroy form_field" do
    assert_difference('FormField.count', -1) do
      delete :destroy, id: @form_field
    end

    assert_redirected_to form_fields_path
  end
end
