class AddNotNullConstraintToCategoryIsDefault < ActiveRecord::Migration[7.0]
  def change
    change_column :categories, :is_default, :boolean, null: false, default: false
  end
end
