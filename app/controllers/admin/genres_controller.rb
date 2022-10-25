class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @genre   = Genre.new
    @genres_image  = Genre.where(contents_status: 0)
    @genres_video  = Genre.where(contents_status: 1)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to request.referer
    else
      @genre   = Genre.new
      @genres  = Genre.all
      render :index
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      redirect_to edit_admin_genre_path
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :contents_status)
  end
end
