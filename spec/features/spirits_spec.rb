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

  scenario "can update a spirit" do
    @spirit = FactoryBot.create(:spirit, name: "Robert Mondavi", abv: 13, spirit_type: "Wine")
    visit spirit_path(@spirit)
    click_link "Edit your spirit"
    expect(page).to have_field("Name", :with => "Robert Mondavi")
    expect(page).to have_field("Abv", :with => 13.0)
    expect(page).to have_field("Spirit type", :with => "Wine")

    fill_in "Name", with: "Opus One"
    fill_in "Abv", with: 14
    fill_in "Spirit type", with: "Expensive wine"

    click_button "Update Spirit"
    @spirit.reload

    expect(page).to have_content("Spirit Name: Opus One")
    expect(@spirit.name).to eq("Opus One")
  end
end




# @spirit = FactoryBot.create(:spirit, name: "Buffalo Trace")