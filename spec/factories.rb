# By using the symbol ':user', we get Factory Girl to simulate the User model.

#FactoryGirl.define do
#  factory :user, aliases: [:author]  do
#    name "DJ"
#    email "djm@example.com"
#    password "foobar"
#    password_confirmation "foobar"
#  end

 # factory :micropost do
#    author
#    title "A big black cat"
#    content "the climb up trees"
#  end  

#end


Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :micropost do |micropost|
  include ActionDispatch::TestProcess
  micropost.title "Foo Bar"
  micropost.content 'Is not to be confused with "fubar".'
  #micropost.photo { fixture_file_upload '/Library/Application\ Support/Apple/iChat\ Icons/Gems/Ruby\ Round.gif', 'image/gif'}
  micropost.association :user
end
