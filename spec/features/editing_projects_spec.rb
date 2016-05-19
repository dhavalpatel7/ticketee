require 'spec_helper'

feature "Editing Projects" do
  before do
    FactoryGirl.create(:project, name: "TextMate 2")
    visit '/'
    click_link "TextMate 2"
  end

  scenario "Updating a project" do
    click_link "Edit Project"
    fill_in "Name", with: "TextMate 2 Beta"
    click_button "Update Project"

    expect(page).to have_content("Project has been updated")
  end

  scenario "Deleting a project" do
    click_link "Delete Project"
    expect(page).to have_no_content("TextMate 2")
  end
end
