require 'spec_helper'

module SpecHelpers
  def create_logged_in_blogger
    user = create_logged_in_user
    user.add_role :blogger
    user
  end
end
