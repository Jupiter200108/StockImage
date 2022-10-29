class Public::HomesController < ApplicationController
  def top
    @genres = Genre.where(contents_status: "0").limit(4)
    @items = Item.where(is_active: true).select{ |item| item.content.content_type.include?('image/')}.take(15)
  end
end
