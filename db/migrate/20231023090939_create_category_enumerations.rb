class CreateCategoryEnumerations < ActiveRecord::Migration[7.0]
  def change
    create_table :category_enumerations do |t|
      t.references :enumeration, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
