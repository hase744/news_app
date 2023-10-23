class CategoriesController < ApplicationController
  def show
    @categories = Category.where("start_at < ?", DateTime.now)
    @categories_params = @categories.map do |c|
      {
        'name' => 'name',
        'japanese_name' => 'japanese_name'
      }
    end
    respond_to do |format|
      format.html
      format.json { render json: @categories_params.to_json }
    end
  end
end
