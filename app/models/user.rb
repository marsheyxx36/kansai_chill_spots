class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, uniqueness: true
  has_many :posts
  has_many :likes, dependent: :destroy
  # def already_liked?(post)
  #   self.likes.exists?(post_id: post.id)
  # end

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end
end
