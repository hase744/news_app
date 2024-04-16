class AddUserToCategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :user, null: true, default: nil, foreign_key: true
    add_column :categories, :image_url, :string, null: true, default: ''
  end
end
