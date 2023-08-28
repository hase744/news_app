class CategoriesController < ApplicationController
  def index
    @categories = Category.where("start_at < ?", DateTime.now)
    categories_param = @categories.map do |category|
      {
      "name" => category.name,
      "japanese_name" => category.japanese_name,
      "press" => Press.where(category: category).last.news_json
    }
    end
    respond_to do |format|
      format.html
      format.json { render json: categories_param.to_json }
    end
  end
end
