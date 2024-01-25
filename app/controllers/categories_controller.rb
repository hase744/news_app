class CategoriesController < ApplicationController
  def show
    @categories = Category.where("start_at < ?", DateTime.now)
    @categories = @categories.where(is_default: true) if params[:is_default] == 'true'
    @categories_params = @categories.map do |c|
      {
        'name' => c.name,
        'japanese_name' => c.japanese_name,
        'is_default' => c.is_default,
        'is_formal' => c.is_formal,
        'emoji' => c.emoji
      }
    end
    respond_to do |format|
      format.html
      format.json { render json: @categories_params.to_json }
    end
  end
end
