class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :posts, foreign_key: :author_id

  validates :name, presence: true
  validates :postscounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  before_validation :assign_posts_counter

  def assign_posts_counter
    self.postscounter = posts.count
  end

  def most_three_recent_post
    posts.order(created_at: :desc).limit(3)
  end
end
