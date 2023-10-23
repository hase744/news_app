class CreateEnumerations < ActiveRecord::Migration[7.0]
  def change
    create_table :enumerations do |t|
      t.text :words
      t.string :sort
      
      t.timestamps
    end
  end
end
