FactoryGirl.define do
  factory :post do
    date Date.today
    rational "testing"
    user
  end

  factory :secound_post, class: "Post" do
    date Date.yesterday
    rational "Some rational"
    user
  end

  factory :post_from_other_user, class: "Post" do
    date Date.yesterday
    rational "Some rational"
    non_authorized_user
  end

end