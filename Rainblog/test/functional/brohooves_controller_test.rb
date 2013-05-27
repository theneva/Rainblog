require 'test_helper'

class BrohoovesControllerTest < ActionController::TestCase
  setup do
    @brohoof = brohooves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brohooves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brohoof" do
    assert_difference('Brohoof.count') do
      post :create, brohoof: { post_id: @brohoof.post_id, user_id: @brohoof.user_id }
    end

    assert_redirected_to brohoof_path(assigns(:brohoof))
  end

  test "should show brohoof" do
    get :show, id: @brohoof
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @brohoof
    assert_response :success
  end

  test "should update brohoof" do
    put :update, id: @brohoof, brohoof: { post_id: @brohoof.post_id, user_id: @brohoof.user_id }
    assert_redirected_to brohoof_path(assigns(:brohoof))
  end

  test "should destroy brohoof" do
    assert_difference('Brohoof.count', -1) do
      delete :destroy, id: @brohoof
    end

    assert_redirected_to brohooves_path
  end
end
