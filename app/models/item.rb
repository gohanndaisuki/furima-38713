class Item < ApplicationRecord
  belongs_to :user
  #has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :delivery_duration

  validates :image, :name, :describe, :category_id, :condition_id, :shipping_fee_status_id, :prefecture_id, :delivery_duration_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :category_id, :condition_id, :shipping_fee_status_id, :prefecture_id, :delivery_duration_id, numericality: { other_than: 1 , message: "can't be blank"}
end
