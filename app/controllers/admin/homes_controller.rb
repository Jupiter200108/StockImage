class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @items = Item.page(params[:page]).per(80)
  end
end
