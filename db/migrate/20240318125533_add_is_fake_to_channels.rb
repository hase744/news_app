class AddIsFakeToChannels < ActiveRecord::Migration[7.0]
  def change
    add_column :channels, :is_fake, :boolean, default: false
  end
end
