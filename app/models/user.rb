class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :comments,dependent: :destroy
  # def already_liked?(post)
  #   self.likes.exists?(post_id: post.id)
  # end

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end

  devise :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
