require "rails_helper"

RSpec.feature "some word" do
  scenario "can see spirits index" do
    visit spirits_path
    expect(page.text).to include("This is the spirits page")
  end

  scenario "can navigate to a spirit's show page" do
    @spirit = FactoryBot.create(:spirit, name: "Buffalo Trace")
    visit spirits_path
    expect(page).to have_content("Buffalo Trace")
    click_link("Buffalo Trace")
    expect(page).to have_content("This is your #{@spirit.name} show page.")
  end

  scenario "can create a new spirit" do
    visit spirits_path
    click_link "Create a new spirit"
    expect(page).to have_content("This is your spirit creation page.")
    fill_in "spirit[name]", with: "Buffalo Trace"
    fill_in "spirit[spirit_type]", with: "Bourbon"
    fill_in "spirit[abv]", with: 50
    click_button "Create Spirit"
    expect(page).to have_content "Spirit Name: Buffalo Trace"
  end

  scenario "can delete a spirit" do
    FactoryBot.create(:spirit, name: "Bulleit", abv: 45, spirit_type: "Bourbon")
    visit spirits_path
    click_link("Bulleit")
    expect(page).to have_content "Bulleit"
    click_link "Delete"
    expect(page).to_not have_content("Bulleit")
    expect(Spirit.where(name: "Bulleit").exists?).to eq(false)

  end
end



# We should write some befores...

# @spirit = FactoryBot.create(:spirit, name: "Buffalo Trace")