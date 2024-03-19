class Summary < ApplicationRecord
  belongs_to :video
  belongs_to :user
  delegate :youtube_id, to: :video, prefix: true
  attr_accessor :youtube_id
  attr_accessor :uuid
  before_validation :set_video
  before_validation :set_user
  serialize :question, Array
  
  def set_video
    if youtube_id
      self.video = Video.find_by(youtube_id: youtube_id)
    end
  end

  def set_user
    if uuid
      self.user = User.find_by(uuid: uuid)
    end
  end

  def is_success
    summarized_at.present?
  end

  def encoded_id
    if youtube_id.length > 11
      Base64.decode64(self.youtube_id)
        .split('.')
        .last
    else
      youtube_id
    end
  end

  def result_param
    {
      'order' => order,
      'answer' => answer,
      'is_success' => is_success
    }
  end
end