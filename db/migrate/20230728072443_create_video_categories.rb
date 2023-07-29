class CreateVideoCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :video_categories do |t|
      t.references :category
      t.references :video

      t.timestamps
    end
  end
end
