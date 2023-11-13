require "rails_helper"

RSpec.describe Outing, type: :model do
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
    @outing2 = Outing.create(name: "Skiing", location: "Aspen", date: "1/1/22")
  end

  describe "relationships" do
    it { should have_many :contestant_outings }
    it { should have_many(:contestants).through(:contestant_outings) }
  end

  it "count_of_contestants" do
    expect(@outing1.count_of_contestants).to eq(1)
    
    @contestant2.outings << @outing1
    expect(@outing1.count_of_contestants).to eq(2)
  end

  it "contestant_names" do
    expect(@outing1.contestant_names).to eq([@contestant1.name])
    @contestant2.outings << @outing1
    @outing1.reload
    expect(@outing1.contestant_names).to eq([@contestant1.name, @contestant2.name])

  end
end