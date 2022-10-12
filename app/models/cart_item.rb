class CartItem < ApplicationRecord
  belongs_to :item_id
  belongs_to :end_user_id
  
  has_many_attached :images
  
  def subtotal
    item.add_tax_price*amount
  end
end
