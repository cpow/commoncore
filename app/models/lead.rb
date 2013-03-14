class Lead < ActiveRecord::Base
  attr_accessible :email, :name, :origin, :lead_type
  validates :email, :name, :presence => true
end
