require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe 'create' do
    before do
      @order_destination = FactoryBot.build(:order_destination)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_destination).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @order_destination.postal_code = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがないと保存できないこと' do
      @order_destination.postal_code = "1111111"
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Postal code Input correctly")
    end
    it 'prefecture_idが空だと保存できないこと' do
      @order_destination.prefecture_id = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが1では登録できないこと' do
      @order_destination.prefecture_id = 1
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Prefecture Select")
    end
    it 'cityが空だと保存できないこと' do
      @order_destination.city = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @order_destination.address = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Address can't be blank")
    end
    it 'building_nameが空でも保存できること' do
      @order_destination.building_name = nil
      expect(@order_destination).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_destination.phone_number = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが12桁以上だと保存できないこと' do
      @order_destination.phone_number = "111122223333"
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end  
  end
end
