class Film < ApplicationRecord
  has_many :film_characters
  has_many :film_planets
  has_many :film_species
  has_many :film_starships
  has_many :film_vehicles

  has_many :characters, through: :film_characters
  has_many :planets, through: :film_planets
  has_many :starships, through: :film_starships
  has_many :species, through: :film_species
  has_many :vehicles, through: :film_vehicles
end
