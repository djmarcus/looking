require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = "Lookinforit.com sample app"
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have the right title" do
      get 'home'
      response.should have_selector("title",
                        :content => @base_title + " | Home")
    end
  end

  describe "GET 'auto'" do
    it "should be successful" do
      get 'auto'
      response.should be_success
    end

    it "should have the right title" do
      get 'auto'
      response.should have_selector("title",
                        :content => @base_title + " | Auto")
    end
  end

  describe "GET 'collectable'" do
    it "should be successful" do
      get 'collectable'
      response.should be_success
    end

    it "should have the right title" do
      get 'collectable'
      response.should have_selector("title",
                        :content => @base_title + " | Collectable")
    end
  end

  describe "GET 'nostalgia'" do
    it "should be successful" do
      get 'nostalgia'
      response.should be_success
    end

    it "should have the right title" do
      get 'nostalgia'
      response.should have_selector("title",
                        :content => @base_title + " | Nostalgia")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have the right title" do
      get 'contact'
      response.should have_selector("title",
                        :content => @base_title + " | Contact")
    end
  end

  describe "GET 'howitworks'" do
    it "should be successful" do
      get 'howitworks'
      response.should be_success
    end

    it "should have the right title" do
      get 'howitworks'
      response.should have_selector("title",
                        :content => @base_title + " | How It Works")
    end
  end
end

