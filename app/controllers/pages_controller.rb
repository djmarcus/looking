class PagesController < ApplicationController
  def home
    @search = Micropost.search do
      fulltext params[:search]
    end
    @microposts = @search.results
   
   
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def auto
    @title = "Auto"
    @search = Micropost.search do
      fulltext params[:search]
      with :category,   'auto'
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
   #@microposts = Micropost.paginate(:page => params[:page])
   #@feed_items = current_user.feed.paginate(:page => params[:page])
  end
  
  def collectable
    @title = "Collectable"

    @search = Micropost.search do
      fulltext params[:search]
      with :category,   'collectable'
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end

  def nostalgia
    @title = "Nostalgia"

    @search = Micropost.search do
      fulltext params[:search]
      with :category,   'nostalgia'
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end

  def contact
    @title = "Contact"
  end

  def howitworks
    @title = "How It Works"
  end

  def microposts
    @title = "Microposts"
  end
end
