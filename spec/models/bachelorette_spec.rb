require "rails_helper"

RSpec.describe Bachelorette, type: :model do
  before(:each) do
    @bachelorette1 = Bachelorette.create(name: "Kardashians", season_number: 1, description: "Try to keep up")
    @bachelorette2 = Bachelorette.create(name: "Joneses", season_number: 2, description: "Who are they?")

    @contestant1 = @bachelorette1.contestants.create(name: "Kim", age: 30, hometown: "LA")
    @contestant2 = @bachelorette1.contestants.create(name: "Chloe", age: 26, hometown: "LA")
    @contestant3 = @bachelorette1.contestants.create(name: "Kanye", age: 36, hometown: "Chi-Town")
    @contestant4 = @bachelorette1.contestants.create(name: "Pete", age: 29, hometown: "NYC")
    
    @contestant5 = @bachelorette2.contestants.create(name: "Mr. Jones", age: 62, hometown: "World-Wide")
  end

  describe "relationships" do
    it {should have_many :contestants}
  end

  it "average_age" do
    expect(@bachelorette1.average_age).to eq(30.25)
    expect(@bachelorette2.average_age).to eq(62)
  end
end
