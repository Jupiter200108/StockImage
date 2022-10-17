class CartItem < ApplicationRecord
  belongs_to :item_id
  belongs_to :end_user_id
  
  has_many_attached :content
  
end
