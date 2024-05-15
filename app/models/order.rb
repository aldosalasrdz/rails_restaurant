class Order < ApplicationRecord
  belongs_to :restaurant
  has_many :items, dependent: :destroy
  has_many :dishes, through: :items

  before_save :calculate_sub_total
  before_save :calculate_taxes
  before_save :calculate_total

  def calculate_sub_total
    self.sub_total = items.sum { |item| item.dish.price * item.quantity }
  end

  def calculate_taxes
    self.taxes = sub_total * 0.11
  end

  def calculate_total
    self.total = sub_total + taxes
  end
end
