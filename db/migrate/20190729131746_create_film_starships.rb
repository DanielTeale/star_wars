class CreateFilmStarships < ActiveRecord::Migration[5.2]
  def change
    create_table :film_starships do |t|
      t.references :film, foreign_key: true
      t.references :starship, foreign_key: true

      t.timestamps
    end
  end
end
