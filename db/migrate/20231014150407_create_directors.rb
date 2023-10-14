class CreateDirectors < ActiveRecord::Migration[7.1]
  def change
    create_table :directors do |t|
      t.string :name
      t.string :origin_country
      t.date :birth_date
      t.string :favorite_genre

      t.timestamps
    end
  end
end
