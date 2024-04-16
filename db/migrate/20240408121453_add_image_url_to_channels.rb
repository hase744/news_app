class AddImageUrlToChannels < ActiveRecord::Migration[7.0]
  def change
    add_column :channels, :image_url, :string, null: false, default: ''
  end
end
