require 'test_helper'

class ResearchGroupMembersControllerTest < ActionController::TestCase
  setup do
    @research_group_member = research_group_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:research_group_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create research_group_member" do
    assert_difference('ResearchGroupMember.count') do
      post :create, research_group_member: { employee_id: @research_group_member.employee_id, research_group_id: @research_group_member.research_group_id }
    end

    assert_redirected_to research_group_member_path(assigns(:research_group_member))
  end

  test "should show research_group_member" do
    get :show, id: @research_group_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @research_group_member
    assert_response :success
  end

  test "should update research_group_member" do
    patch :update, id: @research_group_member, research_group_member: { employee_id: @research_group_member.employee_id, research_group_id: @research_group_member.research_group_id }
    assert_redirected_to research_group_member_path(assigns(:research_group_member))
  end

  test "should destroy research_group_member" do
    assert_difference('ResearchGroupMember.count', -1) do
      delete :destroy, id: @research_group_member
    end

    assert_redirected_to research_group_members_path
  end
end
