class CreateFilmCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :film_characters do |t|
      t.references :film, foreign_key: true
      t.references :character, foreign_key: true

      t.timestamps
    end
  end
end
