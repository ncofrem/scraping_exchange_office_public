require 'test_helper'

class ScrapingsControllerTest < ActionController::TestCase
  setup do
    @scraping = scrapings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scrapings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scraping" do
    assert_difference('Scraping.count') do
      post :create, scraping: { exchange_office_id: @scraping.exchange_office_id, form_id: @scraping.form_id, money_id: @scraping.money_id, position: @scraping.position, price_type_id: @scraping.price_type_id, scraping: @scraping.scraping }
    end

    assert_redirected_to scraping_path(assigns(:scraping))
  end

  test "should show scraping" do
    get :show, id: @scraping
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scraping
    assert_response :success
  end

  test "should update scraping" do
    patch :update, id: @scraping, scraping: { exchange_office_id: @scraping.exchange_office_id, form_id: @scraping.form_id, money_id: @scraping.money_id, position: @scraping.position, price_type_id: @scraping.price_type_id, scraping: @scraping.scraping }
    assert_redirected_to scraping_path(assigns(:scraping))
  end

  test "should destroy scraping" do
    assert_difference('Scraping.count', -1) do
      delete :destroy, id: @scraping
    end

    assert_redirected_to scrapings_path
  end
end
