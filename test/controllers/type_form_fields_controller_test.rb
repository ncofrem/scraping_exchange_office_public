require 'test_helper'

class TypeFormFieldsControllerTest < ActionController::TestCase
  setup do
    @type_form_field = type_form_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_form_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_form_field" do
    assert_difference('TypeFormField.count') do
      post :create, type_form_field: { name: @type_form_field.name }
    end

    assert_redirected_to type_form_field_path(assigns(:type_form_field))
  end

  test "should show type_form_field" do
    get :show, id: @type_form_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_form_field
    assert_response :success
  end

  test "should update type_form_field" do
    patch :update, id: @type_form_field, type_form_field: { name: @type_form_field.name }
    assert_redirected_to type_form_field_path(assigns(:type_form_field))
  end

  test "should destroy type_form_field" do
    assert_difference('TypeFormField.count', -1) do
      delete :destroy, id: @type_form_field
    end

    assert_redirected_to type_form_fields_path
  end
end
