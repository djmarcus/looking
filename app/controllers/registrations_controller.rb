class RegistrationsController < Devise::RegistrationsController

  def new
    @title = "Sign up"
    super
  end
end
