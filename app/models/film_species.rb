class FilmSpecies < ApplicationRecord
  belongs_to :film
  belongs_to :species
end
