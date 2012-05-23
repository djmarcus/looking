require 'spec_helper'

describe MicropostsController do
  render_views
  
  describe "access control" do

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(new_user_session_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(new_user_session_path)
    end
  end

  describe "POST 'create'" do

    before(:each) do
      @user = sign_in(Factory(:user))
    end

    describe "failure" do

      before(:each) do
        @attr = { :content => "" }
      end

      it "should not create a micropost" do
        lambda do
          post :create, :micropost => @attr
        end.should_not change(Micropost, :count)
      end

      it "should render the home page" do
        post :create, :micropost => @attr
        response.should render_template('pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @attr = {:title => "new post!", :content => "Lorem ipsum" }
      end

      it "should create a micropost" do
        lambda do
          post :create, :micropost => @attr
        end.should change(Micropost, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :micropost => @attr
        response.should redirect_to(root_path)
      end

      it "should have a flash message" do
        post :create, :micropost => @attr
        flash[:success].should =~ /micropost created/i
      end
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @user = Factory(:user)
      @micropost = Factory(:micropost, 
                           :user => @user, 
			   :title => "FB", 
			   :content => "Foo Bar", 
			   :category => "auto")
  end

    it "should be successful" do
      get :show, :id => @micropost
      response.should be_success
    end

    it "should find the right micropost" do
      get :show, :id => @micropost
      assigns(:micropost).should == @micropost
    end
   
    it "should have the right title" do
      get :show, :id => @micropost
      response.should have_selector("title", :content => @micropost.category)
    end

    it "should include the user's email" do
      get :show, :id => @micropost
      response.should have_selector("a", :content => @user.email)
    end
    
    it "should include the micropost content" do
      get :show, :id => @micropost
      response.should have_selector("p", :content => @micropost.content)
    end

    it "should include the micropost title" do
      get :show, :id => @micropost
      response.should have_selector("h1", :content => @micropost.title)
    end
  
    it "should display the category on the page" do
      get :show, :id => @micropost
      response.should have_selector("p", :content => @micropost.category)
    end
  end


  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do

      before(:each) do
        @user = Factory(:user)
        wrong_user = Factory(:user, :email => Factory.next(:email))
        sign_in(wrong_user)
        @micropost = Factory(:micropost, :user => @user)
      end

      it "should deny access" do
        delete :destroy, :id => @micropost
        response.should redirect_to(root_path)
      end
    end

    describe "for an authorized user" do

      before(:each) do
        @user = sign_in(Factory(:user))
        #@micropost = Factory(:micropost, :user => @user)
        #@micropost = Factory(:micropost,
        #                     :user => @user,
        #                     :title => "FB",
        #                     :content => "Foo Bar",
        #                     :category => "auto")
        @micropost = nil
      end

      it "should destroy the micropost" do
        lambda do 
          delete :destroy, :id => @micropost
        end.should change(Micropost, :count).by(-1)
      end
    end
  end
end

