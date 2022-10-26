class Category < ApplicationRecord
  has_many :items,dependent: :destroy

  validates :name, presence: true, uniqueness: true


  scope :name_like, -> name {
    where('categories.name like ?', "%#{name}%")
  }

end
