class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :lesson_plans
  has_many :posts
  has_many :products
  has_one :stripe_connect

  after_commit :flush_cache

  def self.cached_find(id)
    Rails.cache.fetch([name, id]) {find(id)}
  end

  def flush_cache
    Rails.cache.delete([self.class.name, id])
  end
end
