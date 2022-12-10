class DeliveryAddress < ApplicationRecord
  belongs_to :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
