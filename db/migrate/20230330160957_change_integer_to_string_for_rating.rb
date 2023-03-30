class ChangeIntegerToStringForRating < ActiveRecord::Migration[7.0]
  def change
    change_column :films, :rating, :string, default: "Livre"
  end
end
