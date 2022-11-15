class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @items = Item.includes(:content_blob).page(params[:page]).per(50)
  end
end
