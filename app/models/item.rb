class Item < ApplicationRecord
  has_one_attached :content
  belongs_to :category
  belongs_to :genre
  belongs_to :end_user
  has_many :cart_items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :order_details
  has_many :tags, dependent: :destroy

  validates :content, presence: true
  validates :name, presence: true, length: { in: 1..15 }
  validates :introduction, presence: true, length: { in: 1..75 }
  validates :genre_id, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: [true, false]

  scope :search_by_content, ->  do
    joins(:category)
    .joins(:tags)
    .joins(:genre)
  end

  def favorited_by?(end_user)
    favorites.where(end_user_id: end_user.id).exists?
  end

  def add_tax_price
    (self.price * 1.1).round
  end

  def is_active_check
    if is_active == true
      "公開"
    else
      "非公開"
    end
  end

  def self.looks(word)
    Item.search_by_content.merge(Tag.name_like word).or(
      Item.search_by_content.merge(Category.name_like word)).or(
        Item.search_by_content.merge(Genre.name_like word)).or(
          where("items.name LIKE?", "%#{word}%")).distinct
  end
end
