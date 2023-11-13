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

  it "Shows attributes and how many contestants have been on that outing" do
    visit "/outings/#{@outing1.id}"
    
    expect(page).to have_content(@outing1.name)
    expect(page).to have_content(@outing1.date)
    expect(page).to have_content(@outing1.location)
    expect(page).to have_content(@outing1.count_of_contestants)
    expect(page).to have_content(1)
    expect(page).to have_content(@contestant1.name)
    expect(page).to_not have_content(@contestant2.name)
    
    @contestant2.outings << @outing1
    
    visit "/outings/#{@outing1.id}"

    expect(page).to have_content(@outing1.count_of_contestants)
    expect(page).to have_content(2)
    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@contestant2.name)
    # require 'pry'; binding.pry
  end
end