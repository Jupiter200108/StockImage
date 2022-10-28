class Tag < ApplicationRecord
  belongs_to :item
  
   scope :name_like, -> name {
    where('tags.name like ?', "%#{name}%")
  }
  
end
