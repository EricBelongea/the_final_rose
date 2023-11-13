class Bachelorette < ApplicationRecord
  has_many :contestants
  
  def average_age
    contestants.average(:age)
  end

  def list_hometown
    contestants.select("hometown").distinct
  end
end
