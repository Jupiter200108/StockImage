class Item < ApplicationRecord
  has_one_attached :content
  belongs_to :category
  belongs_to :genre
  has_many :cart_items,dependent: :destroy

  #validates :image, presence: true
  #validates :name, presence: true, uniqueness: true
  #validates :introduction, presence: true
  #validates :genre_id, presence: true
  #validates :price, presence: true
  #validates :is_active, inclusion: [true, false]
  
  def is_active_check
    if is_active == true
      "公開"
    else
      "非公開"
    end
  end
  
  def self.search(word)
    @item = Item.where("name LIKE?","%#{word}%")
  end
end
