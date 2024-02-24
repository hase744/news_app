class CreateSummaries < ActiveRecord::Migration[7.0]
  def change
    create_table :summaries do |t|
      t.references :user, index: true
      t.references :video, index: true
      t.string :order
      t.text :question
      t.text :answer
      t.datetime :summarized_at
      t.timestamps
    end
  end
end