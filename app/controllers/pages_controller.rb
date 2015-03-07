class PagesController < ApplicationController
  def home
    @search = Micropost.search do
      fulltext params[:search]
    end
    @microposts = @search.results
   
    @title = nil 
    if signed_in?
      @micropost = Micropost.new
      @microposts = Micropost.where("user_id = ?", current_user).paginate(:page => params[:page])
    end
  end

  def arts_and_crafts 
    @title = "Arts and Crafts"
    @search = Micropost.search do
      fulltext params[:search]
      with :category,   'arts & crafts'
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end

  def automotive_and_motorcycle
    @title = "Automotives and Motorcycles"
    @search = Micropost.search do
      fulltext params[:search]
      with(:category).any_of(['auto','automotive & motorcycle'])
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end
  
  def books 
    @title = "Books"
    @search = Micropost.search do
      fulltext params[:search]
      with :category,   'books'
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end

  def boats 
    @title = "Boats"
    @search = Micropost.search do
      fulltext params[:search]
      with :category,   'boats'
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end

  def clothing 
    @title = "Clothing"
    @search = Micropost.search do
      fulltext params[:search]
      with :category,   'clothing'
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end

  def collectable
    @title = "Collectables"
    @search = Micropost.search do
      fulltext params[:search]
      with(:category).any_of(['collectable','collectables'])
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end

  def electronics 
    @title = "Electronics"
    @search = Micropost.search do
      fulltext params[:search]
      with :category,   'electronics'
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end

  def farm_and_garden 
    @title = "Farm and Garden Items"
    @search = Micropost.search do
      fulltext params[:search]
      with :category,   'farm & garden'
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end

  def furniture
    @title = "Furniture"
    @search = Micropost.search do
      fulltext params[:search]
      with :category,   'furniture'
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end

  def jewelry 
    @title = "Jewelry"
    @search = Micropost.search do
      fulltext params[:search]
      with :category,   'jewelry'
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end

  def lost_and_found 
    @title = "Lost & Found"
    @search = Micropost.search do
      fulltext params[:search]
      with :category,   'lost & found'
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end


  def music_and_musical_instruments 
    @title = "Music and Musical Instruments"
    @search = Micropost.search do
      fulltext params[:search]
      with(:category).any_of(['musical instruments','music & musical instruments'])
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end

  def personals 
    @title = "Personals"
    @search = Micropost.search do
      fulltext params[:search]
      with :category,   'personals'
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end

  def pets_looking_for_a_home 
    @title = "Pets Looking For a Home"
    @search = Micropost.search do
      fulltext params[:search]
      with(:category).any_of(['pets looking for a home'])
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end

  def pets_lost_and_found 
    @title = "Pets Lost & Found"
    @search = Micropost.search do
      fulltext params[:search]
      with(:category).any_of(['pets lost & found'])
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end

  def sportinggoods 
    @title = "Sporting Goods"
    @search = Micropost.search do
      fulltext params[:search]
      with :category,   'sporting goods'
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @microposts = @search.results
  end

  def services_wanted 
    @title = "Services Wanted"
    @search = Micropost.search do
      fulltext params[:search]
      with :category,   'services wanted'
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

  def termsofservice 
    @title = "Terms of Service"
  end
end
