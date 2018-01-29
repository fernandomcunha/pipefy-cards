require 'rails_helper'

RSpec.feature 'Home', type: :feature  do
  scenario 'Visit root page and populate database' do
    visit root_path

    expect(page).to have_link('Fetch new data')
    expect(page).to_not have_content('Pipefy Recruitment Test')
    expect(page).to_not have_content('Back-end Test')

    click_link 'Fetch new data'

    expect(page).to have_content('Pipefy Recruitment Test')
    expect(page).to have_content('Back-end Test')

    within('table') do
      expect(page).to have_xpath(".//tr", count: 5)

      within('thead') do
        expect(page).to have_content("What's the bug?")
        expect(page).to have_content("Describe this bug")
        expect(page).to have_content("Attach screenshots of the bug")
        expect(page).to have_content("Where is the bug?")
        expect(page).to have_content("How does the bug impact the users?")
        expect(page).to have_content("What's the priority?")
        expect(page).to have_content("Bug status")
        expect(page).to have_content("Validation details")
      end

      within('tbody') do
        expect(page).to have_content("Missing translation on open card")
        expect(page).to have_content("Screening")
        expect(page).to have_content("Missing translation on pipe settings")
        expect(page).to have_content("Missing translation on reports")
        expect(page).to have_content("Bug Backlog")
        expect(page).to have_content("Frontend")
        expect(page).to have_content('["Cosmetic problem"]')
        expect(page).to have_content("Low priority")
        expect(page).to have_content("Error on moving card")
        expect(page).to have_content("Queued")
        expect(page).to have_content("Backend")
        expect(page).to have_content('["Critical"]')
        expect(page).to have_content("Critical")
      end
    end
  end
end
