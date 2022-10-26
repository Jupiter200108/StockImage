class Item < ApplicationRecord
  has_one_attached :content
  belongs_to :category
  belongs_to :genre
  belongs_to :end_user
  has_many :cart_items,dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :order_details

  validates :content, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: [true, false]

  scope :search_by_category, -> category_name {
    joins(:category).merge(Category.name_like category_name)
  }

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
    search_by_category(word).or(where("name LIKE?","%#{word}%"))
  end

end
