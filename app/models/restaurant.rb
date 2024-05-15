class Restaurant < ApplicationRecord
  has_one_attached :logo
  has_many :dishes, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :name, :description, :address, :phone, presence: true
  validates :name, uniqueness: true

  validates :phone, format: { with: /\A\d{10}\z/, message: 'debe contener al menos 10 dígitos' }

  validates :logo, presence: true,
                   blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_rage: 1..5.megabytes }
end
