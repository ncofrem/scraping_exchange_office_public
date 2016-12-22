require 'test_helper'

class ExchangeOfficesControllerTest < ActionController::TestCase
  setup do
    @exchange_office = exchange_offices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exchange_offices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exchange_office" do
    assert_difference('ExchangeOffice.count') do
      post :create, exchange_office: { message_id: @exchange_office.message_id, name: @exchange_office.name, url_page: @exchange_office.url_page }
    end

    assert_redirected_to exchange_office_path(assigns(:exchange_office))
  end

  test "should show exchange_office" do
    get :show, id: @exchange_office
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exchange_office
    assert_response :success
  end

  test "should update exchange_office" do
    patch :update, id: @exchange_office, exchange_office: { message_id: @exchange_office.message_id, name: @exchange_office.name, url_page: @exchange_office.url_page }
    assert_redirected_to exchange_office_path(assigns(:exchange_office))
  end

  test "should destroy exchange_office" do
    assert_difference('ExchangeOffice.count', -1) do
      delete :destroy, id: @exchange_office
    end

    assert_redirected_to exchange_offices_path
  end
end
