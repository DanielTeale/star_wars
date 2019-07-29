class Species < ApplicationRecord
  has_many :film_species
  has_many :films, through: :film_species
end
