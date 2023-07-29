class CreateChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :channels do |t|
      t.string :name
      t.string :youtube_id
      t.string :url
      t.integer :total_views
      t.text :description

      t.timestamps
    end
  end
end