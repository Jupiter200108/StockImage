class CartItem < ApplicationRecord
  has_many_attached :content
  belongs_to :item
  belongs_to :end_user
end
