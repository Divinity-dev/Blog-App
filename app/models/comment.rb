class Comment < ApplicationRecord
    
        belongs_to :author, foreign_key: :author_id, class_name: 'User'
        belongs_to :post, class_name: 'Post'
      
        after_save :update_post_Comment_Counter
      
        def update_post_Comment_Counter
          post.increment!(:CommentsCounter)
        end
    
end
