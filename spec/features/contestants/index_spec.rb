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
  end

  it "I see only the contestants for a specific bachelorette" do
    visit "/bachelorettes/#{@bachelorette1.id}/contestants"

    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@contestant1.age)
    expect(page).to have_content(@contestant1.hometown)
    expect(page).to have_content(@contestant2.name)
    expect(page).to have_content(@contestant2.age)
    expect(page).to have_content(@contestant2.hometown)
    expect(page).to have_content(@contestant3.name)
    expect(page).to have_content(@contestant3.age)
    expect(page).to have_content(@contestant3.hometown)
    expect(page).to have_content(@contestant4.name)
    expect(page).to have_content(@contestant4.age)
    expect(page).to have_content(@contestant4.hometown)
    
    expect(page).to_not have_content(@contestant5.name)
    expect(page).to_not have_content(@contestant5.age)
    expect(page).to_not have_content(@contestant5.hometown)
  end
end