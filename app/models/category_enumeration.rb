class CategoryEnumeration < ApplicationRecord
  belongs_to :enumeration
  belongs_to :category
end
