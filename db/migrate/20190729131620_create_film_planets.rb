class CreateFilmPlanets < ActiveRecord::Migration[5.2]
  def change
    create_table :film_planets do |t|
      t.references :film, foreign_key: true
      t.references :planet, foreign_key: true

      t.timestamps
    end
  end
end
