class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @end_users = EndUser.page(params[:page]).per(15)
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to admin_end_user_path(@end_user)
    else
      render :edit
    end
  end

  def search_order
    @genres = Genre.all
    @end_user = EndUser.find(params[:id])
    @end_userorders = Order.where(end_user_id: @end_user.id).page(params[:page]).per(15)
  end

  private
    def end_user_params
      params.require(:end_user).permit(:name, :email, :is_deleted)
    end
end
