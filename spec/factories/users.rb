FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@yopmail.com"
  end
  factory :user do
    first_name "shiv"
    last_name "Patel"
    email {generate :email }
    password "123456"
    password_confirmation "123456"
  end

  factory :admin_user, class: "AdminUser" do
    first_name "admin"
    last_name "user"
    email {generate :email }
    password "123456"
    password_confirmation "123456"
  end
end