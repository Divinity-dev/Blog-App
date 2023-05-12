class Like < ApplicationRecord
  belongs_to :author, class_name: :user
  belongs_to :post

  def update_post_like_counter
    post.increment!(:likescounter)
  end
end
