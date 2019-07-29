class CreateFilmSpecies < ActiveRecord::Migration[5.2]
  def change
    create_table :film_species do |t|
      t.references :species, foreign_key: true
      t.references :film, foreign_key: true

      t.timestamps
    end
  end
end
