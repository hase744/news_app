class AddIsFormalToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :is_formal, :boolean, default: false
  end
end
