class Dish < ApplicationRecord
  has_one_attached :photo
  belongs_to :restaurant
  has_many :items

  validates :name, :description, :price, presence: true
  validates :name, uniqueness: true
  validates :photo, presence: true,
                    blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/webp'], size_range: 1..500.kilobytes }
  validates :name, format: { with: /\A[a-zA-Z 0-9]+\z/,
                             message: 'only allows letters' }
  validates :name, length: { in: 2..150 }

  def dish_name_and_price
    "#{name} - $#{price}"
  end
end
