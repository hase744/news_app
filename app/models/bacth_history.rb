class BacthHistory < ApplicationRecord
  belongs_to :category, class_name: 'Category', optional: true, foreign_key: 'category_id'
  enum :task_name, {
    curate_videos: 0,
    categorize_videos: 1,
    create_news: 2,
  }
end
