class Outing < ApplicationRecord
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings

  def count_of_contestants
    contestants.count
  end

  def contestant_names
    contestants.map do |contestant| 
      contestant
    end
  end
end