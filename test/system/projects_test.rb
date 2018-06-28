require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "creating a Project" do
    visit projects_url
    click_on "New Project"

    fill_in "Agent", with: @project.agent_id
    fill_in "Building Name", with: @project.building_name
    fill_in "Country", with: @project.country
    fill_in "Currency", with: @project.currency
    fill_in "Description", with: @project.description
    fill_in "Display Address", with: @project.display_address
    fill_in "Key Features", with: @project.key_features
    fill_in "Postcode", with: @project.postcode
    fill_in "Prefix", with: @project.prefix
    fill_in "Price", with: @project.price
    fill_in "State", with: @project.state
    fill_in "Street Address", with: @project.street_address
    fill_in "Suburb", with: @project.suburb
    fill_in "Title", with: @project.title
    click_on "Create Project"

    assert_text "Project was successfully created"
    click_on "Back"
  end

  test "updating a Project" do
    visit projects_url
    click_on "Edit", match: :first

    fill_in "Agent", with: @project.agent_id
    fill_in "Building Name", with: @project.building_name
    fill_in "Country", with: @project.country
    fill_in "Currency", with: @project.currency
    fill_in "Description", with: @project.description
    fill_in "Display Address", with: @project.display_address
    fill_in "Key Features", with: @project.key_features
    fill_in "Postcode", with: @project.postcode
    fill_in "Prefix", with: @project.prefix
    fill_in "Price", with: @project.price
    fill_in "State", with: @project.state
    fill_in "Street Address", with: @project.street_address
    fill_in "Suburb", with: @project.suburb
    fill_in "Title", with: @project.title
    click_on "Update Project"

    assert_text "Project was successfully updated"
    click_on "Back"
  end

  test "destroying a Project" do
    visit projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project was successfully destroyed"
  end
end
