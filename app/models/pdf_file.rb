class PdfFile < ApplicationRecord
  mount_uploader :file, PdfUploader
end
