class Like < ApplicationRecord
  belongs_to :author, class_name: :User
  belongs_to :post

  after_save :update_post_like_counter

  def update_post_like_counter
    post.increment!(:LikesCounter)
  end
end
