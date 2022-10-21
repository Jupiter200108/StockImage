class Genre < ApplicationRecord
  enum contents_status: { image: 0, video: 1 }
  has_many :items,dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
