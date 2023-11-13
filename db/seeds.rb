# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@bachelorette1 = Bachelorette.create(name: "Kardashians", season_number: 1, description: "Try to keep up")
@bachelorette2 = Bachelorette.create(name: "Joneses", season_number: 2, description: "Who are they?")

@contestant1 = @bachelorette1.contestants.create(name: "Kim", age: 30, hometown: "LA")
@contestant2 = @bachelorette1.contestants.create(name: "Chloe", age: 26, hometown: "LA")
@contestant3 = @bachelorette1.contestants.create(name: "Kanye", age: 36, hometown: "Chi-Town")
@contestant4 = @bachelorette1.contestants.create(name: "Pete", age: 29, hometown: "NYC")

@contestant5 = @bachelorette2.contestants.create(name: "Mr. Jones", age: 62, hometown: "World-Wide")

@outing1 = @contestant1.outings.create(name: "Heli Ride", location: "Maui", date: "7/4/21")
@outing2 = @contestant1.outings.create(name: "Skiing", location: "Aspen", date: "1/1/22")

@outing1.contestants << @contestant2
@outing1.contestants << @contestant3
@outing1.contestants << @contestant4