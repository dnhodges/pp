require 'test_helper'

class IncludeDrinksControllerTest < ActionController::TestCase
  setup do
    @include_drink = include_drinks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:include_drinks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create include_drink" do
    assert_difference('IncludeDrink.count') do
      post :create, include_drink: @include_drink.attributes
    end

    assert_redirected_to include_drink_path(assigns(:include_drink))
  end

  test "should show include_drink" do
    get :show, id: @include_drink
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @include_drink
    assert_response :success
  end

  test "should update include_drink" do
    put :update, id: @include_drink, include_drink: @include_drink.attributes
    assert_redirected_to include_drink_path(assigns(:include_drink))
  end

  test "should destroy include_drink" do
    assert_difference('IncludeDrink.count', -1) do
      delete :destroy, id: @include_drink
    end

    assert_redirected_to include_drinks_path
  end
end
