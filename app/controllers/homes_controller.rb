class HomesController < ApplicationController
  def index
    category = Category.find_by(name:params[:category])
    category = Category.first if !category.present?
    @press = Press.where(category: category).last
    @videos = JSON.parse(@press.news_json)
    respond_to do |format|
      format.html
      format.json { render json: @press.news_json.to_json }
    end
  end
end
