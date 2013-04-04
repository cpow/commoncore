class Product < ActiveRecord::Base
  attr_accessible :price, :productable_id, :productable_type, :user_id

  belongs_to :user
  belongs_to :productable, :polymorphic => true
end
