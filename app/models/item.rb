class Item < ApplicationRecord
  belongs_to :order
  belongs_to :dish

  validates :quantity, presence: true
end
