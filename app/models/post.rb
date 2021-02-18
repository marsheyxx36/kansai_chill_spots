class Post < ApplicationRecord
    has_one_attached :image
    belongs_to :user

    validates :name, presence: true
    validates :description, presence: true
    validates :address, presence: true
    validates :latitude,presence: {message:'を入力し、上のマップ検索ボタンでマップの場所を特定してください'}
    validates :longitude,presence:true
    validates :image, presence: true
    
    # def image_presence
    #     unless image.attached?
    #       errors.add(:image, 'ファイルを添付してください')
    #     end
    # end
end