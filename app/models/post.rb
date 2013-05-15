class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user, :user_id

  belongs_to :user
  has_many :comments, :as => :commentable

  validates :title, :body, :user_id, presence: true

  after_commit :flush_cache

  def self.cached_index
   Rails.cache.fetch([name, "cached_index"]){Post.all(order: "created_at DESC")}
  end

  def cached_user
    Rails.cache.fetch([self, "user"]) {user}
  end

  def self.cached_find(id)
    Rails.cache.fetch([name, id]) {find(id)}
  end

  def flush_cache
    Rails.cache.delete([self.class.name, id])
  end

  def cached_comments
    Rails.cache.fetch([self, "comments"]) {comments.to_a}
  end
end
