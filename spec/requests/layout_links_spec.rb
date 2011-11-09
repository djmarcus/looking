require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
     get '/'
     response.should have_selector('title', :content => "Home")
  end

  it "should have an Auto page at '/auto'" do
     get '/auto'
     response.should have_selector('title', :content => "Auto")
  end

  it "should have a Collectable page at '/collectable'" do
     get '/collectable'
     response.should have_selector('title', :content => "Collectable")
  end

  it "should have a Nostalgia page at '/nostalgia'" do
    get '/nostalgia'
    response.should have_selector('title', :content => "Nostalgia")
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "should have an How It Works page at '/howitworks'" do
    get '/howitworks'
    response.should have_selector('title', :content => "How It Works")
  end

  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "Auto"
    response.should have_selector('title', :content => "Auto")
    click_link "Collectable"
    response.should have_selector('title', :content => "Collectable")
    click_link "Nostalgia"
    response.should have_selector('title', :content => "Nostalgia")
    click_link "How It Works"
    response.should have_selector('title', :content => "How It Works")
    click_link "Home"
    response.should have_selector('title', :content => "Home")
    click_link "Sign up now!"
    response.should have_selector('title', :content => "Sign up")
  end

  describe "when not signed in" do 
    it "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => signin_path,
                                         :content => "Sign in")
    end
  end

  describe "when signed in" do

    before(:each) do
      @user = Factory(:user)
      integration_sign_in(@user)
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => signout_path,
                                         :content => "Sign out")
    end

    it "should have a profile link" do
      visit root_path
      response.should have_selector("a", :href => user_path(@user),
                                         :content => "Profile")
    end
  end
end
