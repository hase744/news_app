class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :youtube_id
      t.integer :total_seconds
      t.text :description
      t.string :title
      t.references :channel
      t.datetime :published_at
      t.integer :total_views, default: 0
      t.string :live_status, default: ''
      t.datetime :categorized_at
      t.boolean :is_live

      t.timestamps
    end
  end
end