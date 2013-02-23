class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user, :user_id

  belongs_to :user
  validates :title, :body, :user_id, presence: true
  WillPaginate.per_page = 5
end
