class AddCastAndRatingToFilm < ActiveRecord::Migration[7.0]
  def change
    add_column :films, :cast, :string, default: "Não informado"
    add_column :films, :rating, :integer, default: 14
  end
end
