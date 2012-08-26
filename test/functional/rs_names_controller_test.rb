require 'test_helper'

class RsNamesControllerTest < ActionController::TestCase
  setup do
    @rs_name = rs_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rs_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rs_name" do
    assert_difference('RsName.count') do
      post :create, rs_name: { name: @rs_name.name, user_id: @rs_name.user_id }
    end

    assert_redirected_to rs_name_path(assigns(:rs_name))
  end

  test "should show rs_name" do
    get :show, id: @rs_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rs_name
    assert_response :success
  end

  test "should update rs_name" do
    put :update, id: @rs_name, rs_name: { name: @rs_name.name, user_id: @rs_name.user_id }
    assert_redirected_to rs_name_path(assigns(:rs_name))
  end

  test "should destroy rs_name" do
    assert_difference('RsName.count', -1) do
      delete :destroy, id: @rs_name
    end

    assert_redirected_to rs_names_path
  end
end
