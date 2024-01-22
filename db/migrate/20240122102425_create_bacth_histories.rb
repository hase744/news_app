class CreateBacthHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :bacth_histories do |t|
      t.integer :task_name, default: 0
      t.references :category
      t.boolean :is_completed, default: false

      t.timestamps
    end
  end
end
