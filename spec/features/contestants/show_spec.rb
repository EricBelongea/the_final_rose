require "rails_helper"

RSpec.describe "Contestants Index" do
  before(:each) do
    @bachelorette1 = Bachelorette.create(name: "Kardashians", season_number: 1, description: "Try to keep up")
    @bachelorette2 = Bachelorette.create(name: "Joneses", season_number: 2, description: "Who are they?")

    @contestant1 = @bachelorette1.contestants.create(name: "Kim", age: 30, hometown: "LA")
    @contestant2 = @bachelorette1.contestants.create(name: "Chloe", age: 26, hometown: "LA")
    @contestant3 = @bachelorette1.contestants.create(name: "Kanye", age: 36, hometown: "Chi-Town")
    @contestant4 = @bachelorette1.contestants.create(name: "Pete", age: 29, hometown: "NYC")
    
    @contestant5 = @bachelorette2.contestants.create(name: "Mr. Jones", age: 62, hometown: "World-Wide")

    @outing1 = @contestant1.outings.create(name: "Heli Ride", location: "Maui", date: "7/4/21")
    @outing2 = @contestant1.outings.create(name: "Skiing", location: "Aspen", date: "1/1/22")
  end

  it "Show contestants information - seaons #, description, and outings which link" do
    visit "/contestants/#{@contestant1.id}"

    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@contestant1.age)
    expect(page).to have_content(@contestant1.hometown)

    expect(page).to have_content(@contestant1.bachelorette.name)
    expect(page).to have_content(@contestant1.bachelorette.season_number)
    expect(page).to have_content(@contestant1.bachelorette.description)
    expect(page).to have_link(@outing1.name)

    click_link(@outing1.name)
    expect(current_path).to eq("/outings/#{@outing1.id}")
  end
end