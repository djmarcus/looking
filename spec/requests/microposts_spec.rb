require 'spec_helper'

describe "Microposts" do

  before(:each) do
    user = Factory(:user)
    visit signin_path
    fill_in :email,    :with => user.email
    fill_in :password, :with => user.password
    click_button
  end
  
  describe "creation" do
    
    describe "failure" do
    
      it "should not make a new micropost" do
        lambda do
          visit root_path
          fill_in :micropost_content, :with => "" 
          fill_in :micropost_title,   :with => ""
	  fill_in :micropost_category, :with => ""
          click_button
          response.should render_template('pages/home')
          response.should have_selector("div#error_explanation")
        end.should_not change(Micropost, :count)
      end
    end

    describe "success" do
  
      it "should make a new micropost" do
        content = "Lorem ipsum dolor sit amet"
        title = "Microtitle!"
	category = "auto"
        lambda do
          visit root_path
          fill_in :micropost_content, :with => content
          fill_in :micropost_title,   :with => title
	  fill_in :micropost_category, :with => category
          click_button
          response.should have_selector("span.content", :content => content)
	  
	  #check to see that the post shows up in the correct category
	  visit auto_path
	  response.should have_selector("span.content", :content => content)
        end.should change(Micropost, :count).by(1)
      end
    end
  end
end
