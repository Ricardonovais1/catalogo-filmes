class CreateFilms < ActiveRecord::Migration[7.0]
  def change
    create_table :films do |t|
      t.string :name
      t.integer :year
      t.string :synopsis
      t.integer :duration

      t.timestamps
    end
  end
end
