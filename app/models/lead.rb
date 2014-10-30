class Lead < ActiveRecord::Base
  validates :email, :name, :presence => true
end
