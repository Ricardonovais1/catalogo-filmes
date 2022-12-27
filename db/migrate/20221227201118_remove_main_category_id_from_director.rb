class RemoveMainCategoryIdFromDirector < ActiveRecord::Migration[7.0]
  def change
    remove_column :directors, :main_category_id, :string
  end
end
