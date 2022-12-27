class CreateDirectors < ActiveRecord::Migration[7.0]
  def change
    create_table :directors do |t|
      t.string :name
      t.string :country
      t.integer :birth_year
      t.references :main_category, null: false, foreign_key: true, default: 0

      t.timestamps
    end
  end
end
