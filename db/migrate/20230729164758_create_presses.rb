class CreatePresses < ActiveRecord::Migration[7.0]
  def change
    create_table :presses do |t|
      t.references :category
      t.text :youtube_ids
      t.text :news_json
      t.boolean :is_published

      t.timestamps
    end
  end
end
