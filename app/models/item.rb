class Item < ApplicationRecord
  has_one_attached :image

  def get_image
    image
  end

  validate :image
  validate :name
  validate :introduction
  validate :price
end
