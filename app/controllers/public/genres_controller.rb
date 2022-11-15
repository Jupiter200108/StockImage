class Public::GenresController < ApplicationController
  def show
    @genres = Genre.find(params[:id])
    @items = @genres.items.includes(:content_blob).where(is_active: true).page(params[:page]).per(50)
  end
end
