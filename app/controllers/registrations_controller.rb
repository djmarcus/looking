class RegistrationsController < Devise::RegistrationsController

  def new
    @title = "Sign up"
    super
  end

  def destroy
    if User.find(params[:id]).admin?
      flash[:info] = "Admins cannot delete themselves!"
    elsif
      User.find(params[:id]).destroy
      flash[:success] = "User destroyed."
    end
    redirect_to users_path
  end


end
