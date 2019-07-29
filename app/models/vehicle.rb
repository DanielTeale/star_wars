class Vehicle < ApplicationRecord
  has_many :film_vehicles
  has_many :films, through: :film_vehicles
end
