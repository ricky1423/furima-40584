class Item < ApplicationRecord

  has_one_attached :image

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shopping_free
  belongs_to :prefecture
  belongs_to :schedule

  validates :image, presence: true
  validates :name, presence: true
  validates :explain, presence: true

  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_free_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :schedule_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }

  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
