require 'test_helper'

class ColorsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @color = colors(:one)
  end

  test "should get index" do
    get :index, params: { user_id: @user }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { user_id: @user }
    assert_response :success
  end

  test "should create color" do
    assert_difference('Color.count') do
      post :create, params: { user_id: @user, color: @color.attributes }
    end

    assert_redirected_to user_color_path(@user, Color.last)
  end

  test "should show color" do
    get :show, params: { user_id: @user, id: @color }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { user_id: @user, id: @color }
    assert_response :success
  end

  test "should update color" do
    put :update, params: { user_id: @user, id: @color, color: @color.attributes }
    assert_redirected_to user_color_path(@user, Color.last)
  end

  test "should destroy color" do
    assert_difference('Color.count', -1) do
      delete :destroy, params: { user_id: @user, id: @color }
    end

    assert_redirected_to user_colors_path(@user)
  end
end
