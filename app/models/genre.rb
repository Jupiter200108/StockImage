class Genre < ApplicationRecord
  enum contents_status: { image: 0, video: 1 }
  has_many :items, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :contents_status, presence: true

  scope :name_like, -> name {
    where("genres.name like ?", "%#{name}%")
  }
end
