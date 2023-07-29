class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :japanese_name
      t.text :word
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.timestamps
    end
  end
end