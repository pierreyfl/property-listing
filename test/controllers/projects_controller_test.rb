require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { agent_id: @project.agent_id, building_name: @project.building_name, country: @project.country, currency: @project.currency, description: @project.description, display_address: @project.display_address, key_features: @project.key_features, postcode: @project.postcode, prefix: @project.prefix, price: @project.price, state: @project.state, street_address: @project.street_address, suburb: @project.suburb, title: @project.title } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { agent_id: @project.agent_id, building_name: @project.building_name, country: @project.country, currency: @project.currency, description: @project.description, display_address: @project.display_address, key_features: @project.key_features, postcode: @project.postcode, prefix: @project.prefix, price: @project.price, state: @project.state, street_address: @project.street_address, suburb: @project.suburb, title: @project.title } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
