class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :end_user

  has_many_attached :contents

end
