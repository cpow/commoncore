class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true, touch: true

  after_commit :clear_commentable_cache

  def clear_commentable_cache
    Rails.cache.clear([self.commentable, "comments"])
  end
end
