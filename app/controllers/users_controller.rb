class UsersController < ApplicationController
before_filter :authenticate 
  
  def index
    @title = "All users"
    @search = User.search do
      fulltext params[:search]
      paginate :page => params[:page], :per_page => 30
    end
    @users = @search.results

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

private 
  def authenticate 
    deny_access unless signed_in? 
    deny_access_non_admin unless current_user.admin?
  end 

  def deny_access
#    store_location
    redirect_to new_user_session_path, :notice => "Please sign in to access this page."
  end

  def deny_access_non_admin
#    store_location
    redirect_to root_path, :notice => "Admin's only!"
  end
  
  def store_location
    session[:return_to] = request.fullpath
  end


end
