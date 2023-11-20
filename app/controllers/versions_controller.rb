class VersionsController < ApplicationController
  def show
    @version = Version.find_by(name: params[:name])
    respond_to do |format|
      format.html
      format.json { render json: @version.to_json }
    end
  end
end
