require "capybara/rspec"
require_relative "../../lib/app"

Capybara.app = SampleApp

feature "home page says hi" do
  scenario "loads the home page and sees Hi you!" do
    visit("/")
    expect(page).to have_content "Hello there!"
  end

  feature "asking for the name" do
    scenario "loads the home page and asks for the name" do
      visit("/")
      expect(page).to have_content "What's your name?"
    end
  end
end
