require 'rails_helper'

RSpec.feature 'Search for a work' do
  let(:title) { ['Journey to Skull Island'] }
  let(:creator) { ['Quest, Jane'] }
  let(:keyword) { ['Pirates', 'Adventure'] }
  let(:visibility) { Hydra::AccessControls::AccessRight::VISIBILITY_TEXT_VALUE_PUBLIC }
  let(:year) { ['1492'] }
  let(:work) do
    Work.new(title: title,
             creator: creator,
             keyword: keyword,
             visibility: visibility,
             year: year)
  end

  context 'general search' do
    before do
      work.save
    end
    scenario "Search for a work" do
      visit("/")
      fill_in "q", with: "Journey"
      click_button "Go"
      # Uncomment this to display the HTML capybara is seeing
      # puts page.body
      expect(page).to have_content work.title.first
      expect(page).to have_content work.creator.first
      expect(page).to have_content work.keyword.first
      expect(page).to have_content work.year.first
      expect(page).to have_xpath("//h3", text: "Creator")
      expect(page).to have_link(work.creator.first, class: "facet_select")
      expect(page).to have_xpath("//h3", text: "Year")
      expect(page).to have_link(work.year.first, class: "facet_select")
    end
  end
end
