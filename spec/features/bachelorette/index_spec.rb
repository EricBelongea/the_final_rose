require "rails_helper"

RSpec.describe "Bachelorette Index" do
  before(:each) do

  end

  it "I see the bachelorettes attributes" do
    visit "/bachelorettes/#{@bachelorette1.id}"

    expect(page).to have_content(@bachelorette1.name)
    expect(page).to have_content(@bachelorette1.season_number)
    expect(page).to have_content(@bachelorette1.description)

    expect(page).to have_link("View Contestants")
    click_link("View Contestants")
    expect(current_path).to eq("/bachelorettes/#{@bachelorette1.id}/contestants")
    
  end
end