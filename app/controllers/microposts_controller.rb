class MicropostsController < ApplicationController
#  before_filter :authenticate_user!, :only => [:create, :destroy]
  before_filter :authenticate_user!, :only=> [:create, :destroy, :edit]
#  before_filter :authorized_user, :only => :destroy

  def index
    @search = Micropost.search do
      fulltext params[:search]
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end

  def show
    @micropost = Micropost.find(params[:id])
    @user = User.find(@micropost.user_id)
    @title = @micropost.category
  end

  def create
    @micropost  = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def edit
  ##tbd...
  end

  def destroy
    @micropost= Micropost.find(params[:id])
    @micropost.destroy
    redirect_to(session[:return_to] || root_path)
    session[:return_to] = nil
  end
end

