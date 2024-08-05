FactoryBot.define do
  factory :purchase_shipping_info do
    postal_code { '158-0082' }
    prefecture_id { 2 }
    city { '世田谷区' }
    address { '等々力5-1-14' }
    building { 'プラートリエ302' }
    phone_number { '09011111111' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { nil }
    item_id { nil }
  end
end
