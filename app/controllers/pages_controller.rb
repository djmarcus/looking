class PagesController < ApplicationController
  def home
  #  @search = Micropost.search do
  #    fulltext params[:search]
  #  end
  #  @microposts = @search.results
   
   
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def auto
    @title = "Auto"
  end
  
  def collectable
    @title = "Collectable"
  end

  def nostalgia
    @title = "Nostalgia"
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
