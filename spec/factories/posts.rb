FactoryGirl.define do
  factory :post do
    date Date.today
    rational "testing "
    user
  end

  factory :secound_post, class: "Post" do
    date Date.yesterday
    rational "Some rational"
    user
  end
end