class Starship < ApplicationRecord
  has_many :film_starships
  has_many :films, through: :film_starships
end
