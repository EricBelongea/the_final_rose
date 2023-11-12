# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@bachelorette1 = Bachelorette.create(name: "Kardashians", season_number: 1, description: "Try to keep up")

@contestant1 = @bachelorette1.contestants.create(name: "Kim", age: 30, hometown: "LA")
@contestant2 = @bachelorette1.contestants.create(name: "Chloe", age: 26, hometown: "LA")
@contestant3 = @bachelorette1.contestants.create(name: "Kanye", age: 36, hometown: "Chi-Town")
@contestant4 = @bachelorette1.contestants.create(name: "Pete", age: 29, hometown: "NYC")