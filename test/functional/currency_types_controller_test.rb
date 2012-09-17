require 'test_helper'

class CurrencyTypesControllerTest < ActionController::TestCase
  setup do
    @currency_type = currency_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:currency_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create currency_type" do
    assert_difference('CurrencyType.count') do
      post :create, currency_type: { code: @currency_type.code, symbol: @currency_type.symbol }
    end

    assert_redirected_to currency_type_path(assigns(:currency_type))
  end

  test "should show currency_type" do
    get :show, id: @currency_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @currency_type
    assert_response :success
  end

  test "should update currency_type" do
    put :update, id: @currency_type, currency_type: { code: @currency_type.code, symbol: @currency_type.symbol }
    assert_redirected_to currency_type_path(assigns(:currency_type))
  end

  test "should destroy currency_type" do
    assert_difference('CurrencyType.count', -1) do
      delete :destroy, id: @currency_type
    end

    assert_redirected_to currency_types_path
  end
end
