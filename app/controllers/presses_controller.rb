class PressesController < ApplicationController
  def index
    @categories = Category.where("start_at < ?", DateTime.now)
    #@categories = @categories.includes(:presses)
    #なぜか上を追加すると本番環境で処理が遅くなってタイムアウトになる
    categories_param = @categories.map do |category|
      {
      "name" => category.name,
      "japanese_name" => category.japanese_name,
      'emoji' => category.emoji,
      'is_default' => category.is_default,
      "press" =>category.presses.last.news_json,
    }
    end
    respond_to do |format|
      format.html
      format.json { render json: categories_param.to_json }
    end
  end
end
