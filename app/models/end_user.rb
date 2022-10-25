class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (is_deleted == false)
  end

  validates :name, presence: true        ,length: { in: 1..15 }

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :order_details, through: :orders
  has_many :ordered_items, through: :order_details, source: :item
  has_many :items
  has_many :favorites, dependent: :destroy
end
