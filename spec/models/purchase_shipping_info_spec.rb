require 'rails_helper'

RSpec.describe PurchaseShippingInfo, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @purchase_shipping_info = FactoryBot.build(:purchase_shipping_info, user_id: @user.id, item_id: @item.id)
    sleep(0.5)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_shipping_info).to be_valid
    end

    it '建物名は空でも保存できること' do
      @purchase_shipping_info.building = ''
      expect(@purchase_shipping_info).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'tokenが空では登録できないこと' do
      @purchase_shipping_info.token = nil
      @purchase_shipping_info.valid?
      expect(@purchase_shipping_info.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空だと保存できないこと' do
      @purchase_shipping_info.postal_code = ''
      @purchase_shipping_info.valid?
      expect(@purchase_shipping_info.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_shipping_info.postal_code = '1234567'
      @purchase_shipping_info.valid?
      expect(@purchase_shipping_info.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it '無効な都道府県id（1）では保存できないこと' do
      @purchase_shipping_info.prefecture_id = 1
      @purchase_shipping_info.valid?
      expect(@purchase_shipping_info.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市町村が空だと入力できないこと' do
      @purchase_shipping_info.city = ''
      @purchase_shipping_info.valid?
      expect(@purchase_shipping_info.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと入力できないこと' do
      @purchase_shipping_info.address = ''
      @purchase_shipping_info.valid?
      expect(@purchase_shipping_info.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空だと入力できないこと' do
      @purchase_shipping_info.phone_number = ''
      @purchase_shipping_info.valid?
      expect(@purchase_shipping_info.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が10桁未満だと保存できないこと' do
      @purchase_shipping_info.phone_number = '090123456'
      @purchase_shipping_info.valid?
      expect(@purchase_shipping_info.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号が12桁以上だと保存できないこと' do
      @purchase_shipping_info.phone_number = '090123456789'
      @purchase_shipping_info.valid?
      expect(@purchase_shipping_info.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号が数字以外を含むと保存できないこと' do
      @purchase_shipping_info.phone_number = '090-1234-5678'
      @purchase_shipping_info.valid?
      expect(@purchase_shipping_info.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
