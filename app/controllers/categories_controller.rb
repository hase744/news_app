class CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    @categories = Category
      .where("start_at < ?", DateTime.now)
    @categories = @categories.where(is_default: true) if params[:is_default] == 'true'
    @categories_params = @categories.map do |c|
      c.output_hash
    end
    respond_to do |format|
      format.html
      format.json { render json: @categories_params.to_json }
    end
  end
end
