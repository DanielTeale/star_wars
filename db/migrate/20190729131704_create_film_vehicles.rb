class CreateFilmVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :film_vehicles do |t|
      t.references :film, foreign_key: true
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
