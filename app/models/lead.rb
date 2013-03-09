class Lead < ActiveRecord::Base
  attr_accessible :email, :name, :origin
  validates :email, :name, :presence => true
end
