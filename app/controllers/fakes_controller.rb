class FakesController < ApplicationController
  def show
    word = params[:word]
    json_data = File.read("public/presses/fake_videos.json")
    @videos = JSON.parse(json_data)
    @videos = @videos.select { |hash| hash["title"].include?(word) } if word
    respond_to do |format|
      format.html
      format.json { render json: @videos.to_json }
    end
  end

  def videos
    respond_to do |format|
      format.html
      format.json do
        file_path = Rails.root.join('public','presses', 'fake_videos.json')
        render file: file_path, content_type: 'application/json', layout: false
      end
    end
  end

  def presses
    respond_to do |format|
      format.html
      format.json do
        file_path = Rails.root.join('public','presses', 'fake_news.json')
        render file: file_path, content_type: 'application/json', layout: false
      end
    end
  end
end
