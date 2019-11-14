FactoryGirl.define do
  factory :post do
    date Date.today
    rational "testing"
    overtime_request 3.5
    user
  end

  factory :secound_post, class: "Post" do
    date Date.yesterday
    rational "Some rational"
    overtime_request 3.5
    user
  end

end