class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  belongs_to :end_user
  has_many :order_details

  def create_order_details(end_user)
    unless order_details.first
      cart_items = end_user.cart_items.includes(:item)
      cart_items.each do |cart_item|
        item = cart_item.item
        OrderDetail.create!(
          order_id: id,
          item_id: item.id,
          price: item.price
        )
      end
      cart_items.includes(:item, :content_attachment).destroy_all
    end
  end
end
