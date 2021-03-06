require 'test_helper'

class StudentGroupAssociationsControllerTest < ActionController::TestCase
  setup do
    @student_group_association = student_group_associations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_group_associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_group_association" do
    assert_difference('StudentGroupAssociation.count') do
      post :create, student_group_association: { student_group_id: @student_group_association.student_group_id, user_id: @student_group_association.user_id }
    end

    assert_redirected_to student_group_association_path(assigns(:student_group_association))
  end

  test "should show student_group_association" do
    get :show, id: @student_group_association
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_group_association
    assert_response :success
  end

  test "should update student_group_association" do
    patch :update, id: @student_group_association, student_group_association: { student_group_id: @student_group_association.student_group_id, user_id: @student_group_association.user_id }
    assert_redirected_to student_group_association_path(assigns(:student_group_association))
  end

  test "should destroy student_group_association" do
    assert_difference('StudentGroupAssociation.count', -1) do
      delete :destroy, id: @student_group_association
    end

    assert_redirected_to student_group_associations_path
  end
end
