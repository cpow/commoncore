class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :productable, :polymorphic => true
  validates :price, presence: true
end
