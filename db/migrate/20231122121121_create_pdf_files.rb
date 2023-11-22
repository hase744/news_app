class CreatePdfFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :pdf_files do |t|
      t.string :title
      t.string :file

      t.timestamps
    end
  end
end
