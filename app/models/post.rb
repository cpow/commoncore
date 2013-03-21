class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user, :user_id

  belongs_to :user
  has_many :comments, :as => :commentable
  
  validates :title, :body, :user_id, presence: true
end
