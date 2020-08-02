class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day_until_shipping

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category
    validates :status
    validates :shipping_fee
    validates :prefecture
    validates :day_until_shipping
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :day_until_shipping_id
  end


  #空の投稿を保存できないようにする
  # validates :category, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  # validates :category_id, numericality: { other_than: 1 }
end
