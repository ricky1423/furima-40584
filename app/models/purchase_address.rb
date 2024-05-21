class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :purchase, :post_code, :prefecture_id, :city, :street, :building_name, :phone_number, :token

  with_options presence: true do
  validates :user_id
  validates :item_id

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
  validates :city
  validates :street
  validates :phone_number, format: { with: /\A\d+\z/, message: "is invalid. Input only number" },
                           length: { in: 10..11, too_short: "is too short"}
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(purchase_id: purchase.id, post_code: post_code, prefecture_id: prefecture_id, city: city, street: street, building_name: building_name, phone_number: phone_number)
  end

end