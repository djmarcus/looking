class MicropostsController < ApplicationController
#  before_filter :authenticate_user!, :only => [:create, :destroy]
  before_filter :authenticate_user!, :only=> [:create, :destroy]
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

  def destroy
    #@micropost.destroy
    #nil.destroy
    @micropost= Micropost.find(params[:id])
    @micropost.destroy
    #redirect_back_or root_path
    redirect_to :back
  end

  private

#    def authorized_user
#      @micropost = current_user.microposts.find_by_id(params[:id])
#      redirect_to root_path if @micropost.nil?
#    end
end

