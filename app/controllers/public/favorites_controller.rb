class Public::FavoritesController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @favorites = current_end_user.favorites.page(params[:page]).per(20)
  end

  def create
    item = Item.find(params[:item_id])
    @favorite = current_end_user.favorites.new(item_id: item.id)
    @favorite.save
    render "replace_btn"
  end

  def destroy
    item = Item.find(params[:item_id])
    @favorite = current_end_user.favorites.find_by(item_id: item.id)
    @favorite.destroy
    render "replace_btn"
  end
end
