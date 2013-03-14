class RegistrationsController < Devise::RegistrationsController
  before_filter :only_admin_user

  def new
    super
  end

  def create
    super
  end

  def update
    super
  end
end 
