class HomesController < ApplicationController
  def index
    category = Category.find_by(name:params[:category])
    category = Category.first if category.present?
    @press = Press.where(category: category).last
    @videos = JSON.parse(@press.news_json)
  end
end
