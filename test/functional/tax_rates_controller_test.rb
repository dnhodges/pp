require 'test_helper'

class TaxRatesControllerTest < ActionController::TestCase
  setup do
    @tax_rate = tax_rates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tax_rates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tax_rate" do
    assert_difference('TaxRate.count') do
      post :create, tax_rate: @tax_rate.attributes
    end

    assert_redirected_to tax_rate_path(assigns(:tax_rate))
  end

  test "should show tax_rate" do
    get :show, id: @tax_rate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tax_rate
    assert_response :success
  end

  test "should update tax_rate" do
    put :update, id: @tax_rate, tax_rate: @tax_rate.attributes
    assert_redirected_to tax_rate_path(assigns(:tax_rate))
  end

  test "should destroy tax_rate" do
    assert_difference('TaxRate.count', -1) do
      delete :destroy, id: @tax_rate
    end

    assert_redirected_to tax_rates_path
  end
end
