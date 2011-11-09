class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy



  def index
    @title = "All users"
    @search = Sunspot.search User do
      fulltext params[:search]
      paginate :page => params[:page], :per_page => 30
    end
    @users = @search.results
  end

		      

#  def index
#    @title = "All users"
#    @users = User.paginate(:page => params[:page])
#  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = @user.name
  end
 
  def new
    unless signed_in?
      @user = User.new
      @title = "Sign up"
    else
      flash[:info] = "Must log out to create a new user!"
      redirect_to root_path
    end
  end

  def create
    unless signed_in?
      @user = User.new(params[:user])
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
      else
        @user.password = nil
        @user.password_confirmation = nil
        @title = "Sign up"
        render 'new'
      end
    else 
      flash[:info] = "Must log out to create a new user!"
      redirect_to root_path
    end
  end

  def edit
    @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
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
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
