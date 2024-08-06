class PurchaseShippingInfo
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token, :purchase_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' },
                             length: { minimum: 10, maximum: 11, message: 'is too short' }
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # 購入情報を保存し、変数purchaseに代入する
    purchase = Purchase.create(user_id:, item_id:)
    # 住所情報を保存する
    # purchase_idには、変数purchaseのidを指定する
    ShippingInfo.create(
      postal_code:,
      prefecture_id:,
      city:,
      address:,
      building:,
      phone_number:,
      purchase_id: purchase.id
    )
  end
end
