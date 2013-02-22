class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user, :user_id

  belongs_to :user
  validates :title, :body, :user_id, presence: true

  rails_admin do
    edit do
      field :title

      field :body, :text do
        bootstrap_wysihtml5 true
      end
    
      configure :user do
        visible false
      end
  
      field :user_id, :hidden do
        visible true
        default_value do
          bindings[:view].current_user.id
        end
      end
    end
  end
end
