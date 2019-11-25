FactoryGirl.define do
  sequence :email do |n|
    "test#{n}ga@yopmail.com"
  end
  factory :user do
    first_name "shiv"
    last_name "Patel"
    email {generate :email }
    password "123456"
    password_confirmation "123456"
    phone "0123456789"
  end

  factory :admin_user, class: "AdminUser" do
    first_name "admin"
    last_name "user"
    email {generate :email }
    password "123456"
    password_confirmation "123456"
    phone "0123456789"
  end

  factory :non_authorized_user, class: "User" do
    first_name "Non"
    last_name "authorized"
    email {generate :email }
    password "123456"
    password_confirmation "123456"
    phone "0123456789"
  end
end
