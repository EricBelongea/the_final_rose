class Outing < ApplicationRecord
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings

  def count_of_contestants
    contestants.count
  end

  # I had this originally, but I needed the contestant ID for routing and to
  # be able to remove them from the outing so I used AR associations here instead
  # of this method. Less code.

  ### UPDATE on ABOVE ###
  # I changed this to use AR then in the controller used find_by()
  # in order to find the contestant via their name/ find without params[:id]

  # def contestant_names
  #   contestants.map do |contestant| 
  #     contestant.name
  #   end
  # end

  # This is the ruby above refactored into AR
  def contestant_names
    contestants.pluck("name")
  end
end