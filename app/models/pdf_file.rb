class PdfFile < ApplicationRecord
  mount_uploader :file, PdfUploader
  validates :title, uniqueness: true, presence: true

  before_validation do #ファイル名を指定
    old_file_name = file.identifier
    self.file.name = title
  end

  after_update do #既存のファイル名を変更
    if title.present?
      new_file_path = File.join(Rails.root, 'public', 'uploads', 'pdf_file', 'file', id.to_s, "#{title}.pdf")
      old_file_dir = File.join(Rails.root, 'public', 'uploads', 'pdf_file', 'file', id.to_s)
      pdf_files = Dir.glob(File.join(old_file_dir, '*.pdf'))
      if pdf_files.any?
        File.rename(pdf_files.first, new_file_path)
      end
    end
  end
end
