class PressesController < ApplicationController
  def show
    @categories = Category.where("start_at < ?", DateTime.now)
    @categories = @categories.includes(:presses)
    categories_param = @categories.map do |category|
      {
      "name" => category.name,
      "japanese_name" => category.japanese_name,
      'emoji' => category.emoji,
      "press" =>category.presses.last.news_json
    }
    end
    respond_to do |format|
      format.html
      format.json { render json: categories_param.to_json }
    end
  end
end
