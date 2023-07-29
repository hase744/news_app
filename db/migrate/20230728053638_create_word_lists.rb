class CreateWordLists < ActiveRecord::Migration[7.0]
  def change
    create_table :word_lists do |t|
      t.references :category, index:true, foreign_key: true
      t.text :words
      t.string :sort

      t.timestamps
    end
  end
end