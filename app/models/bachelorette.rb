class Bachelorette < ApplicationRecord
  has_many :contestants
  
  def average_age
    contestants.average(:age)
  end
end
