class Item < ApplicationRecord
  has_one_attached :contents
  belongs_to :category
  belongs_to :genre
  has_many :cart_items,dependent: :destroy

  #validates :image, presence: true
  #validates :name, presence: true, uniqueness: true
  #validates :introduction, presence: true
  #validates :genre_id, presence: true
  #validates :price, presence: true
  #validates :is_active, inclusion: [true, false]

  def add_tax_price
    (self.price * 1.1).round
  end

  
  def self.search(word)
    @item = Item.where("name LIKE?","%#{word}%")
  end
end
