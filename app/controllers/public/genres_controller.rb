class Public::GenresController < ApplicationController
  def show
      @genres = Genre.all.find(params[:id])
      @items = @genres.items.where(is_active: true).page(params[:page]).per(50)
  end
end
