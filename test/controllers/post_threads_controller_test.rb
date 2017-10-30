require 'test_helper'

class PostThreadsControllerTest < ActionController::TestCase
  setup do
    @post_thread = post_threads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_threads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_thread" do
    assert_difference('PostThread.count') do
      post :create, post_thread: { create_date: @post_thread.create_date, subject: @post_thread.subject }
    end

    assert_redirected_to post_thread_path(assigns(:post_thread))
  end

  test "should show post_thread" do
    get :show, id: @post_thread
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_thread
    assert_response :success
  end

  test "should update post_thread" do
    patch :update, id: @post_thread, post_thread: { create_date: @post_thread.create_date, subject: @post_thread.subject }
    assert_redirected_to post_thread_path(assigns(:post_thread))
  end

  test "should destroy post_thread" do
    assert_difference('PostThread.count', -1) do
      delete :destroy, id: @post_thread
    end

    assert_redirected_to post_threads_path
  end
end
