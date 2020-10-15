require "capybara/rspec"
require_relative "../../lib/app"

Capybara.app = SampleApp

feature "home page says hi" do
  scenario "loads the home page and sees Hi you!" do
    visit("/")
    expect(page).to have_content "Hi you!"
  end
end



