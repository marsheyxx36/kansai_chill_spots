class Post < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :area

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :latitude, presence: { message: 'を入力し、上のマップ検索ボタンでマップの場所を特定してください' }
  validates :longitude, presence: true
  validates :image, presence: true
  validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }
  validates :area_id, numericality: { other_than: 0, message: 'を選択してください' }

  # def image_presence
  #     unless image.attached?
  #       errors.add(:image, 'ファイルを添付してください')
  #     end
  # end
end
