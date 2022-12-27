class AddCategoryToDirector < ActiveRecord::Migration[7.0]
  def change
    add_reference :directors, :category, null: false, foreign_key: true, default: 0
  end
end
