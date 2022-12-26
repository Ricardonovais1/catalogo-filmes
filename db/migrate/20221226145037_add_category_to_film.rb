class AddCategoryToFilm < ActiveRecord::Migration[7.0]
  def change
    add_reference :films, :category, null: false, foreign_key: true, default: 0
  end
end
