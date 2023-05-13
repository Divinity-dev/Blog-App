class Like < ApplicationRecord
  belongs_to :author, class_name: :User
  belongs_to :post

  def update_post_like_counter
    post.increment!(:LikesCounter)
  end
end
