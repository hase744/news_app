class HomesController < ApplicationController
  def index
    category = Category.find_by(name:params[:category])
    category = Category.first if !category.present?
    puts category.japanese_name
    @press = Press.where(category: category).last
    @videos = JSON.parse(@press.news_json)
    respond_to do |format|
      format.html
      format.json { render json: @press.news_json.to_json }
    end
  end

  def search
    word = params[:word]
    @videos = Video.where("title LIKE ?", "%#{word}%").page(20).page(params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @videos.to_json }
    end
  end
end
