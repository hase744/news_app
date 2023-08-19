class CreateChannelCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :channel_categories do |t|
      t.references :channel, index:true, foreign_key: true
      t.references :category, index:true, foreign_key: true
      t.boolean :is_absolute, default:false
      t.timestamps
    end
  end
end