class Item < ApplicationRecord
  has_one_attached :content
  belongs_to :category
  belongs_to :genre
  belongs_to :end_user
  has_many :cart_items,dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :order_details

  validates :content, presence: true
  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :category_id, presence: true
  # validates :price, presence: true
  # validates :is_active, inclusion: [true, false]

  def favorited_by?(end_user)
    favorites.where(end_user_id: end_user.id).exists?
  end

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
