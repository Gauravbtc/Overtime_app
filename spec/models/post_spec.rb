require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    before do
      user = User.create(email: "test@yomail.com", password: "123456",
             password_confirmation: "123456",first_name: "gaurav",
             last_name: "Makwana")
      login_as(@user, :scope => :user)
      @post = Post.create(date: Date.today, rational: "test post",user_id: user.id )
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it "can not be created without date and rational" do
      @post.date = nil
      @post.rational = nil
      expect(@post).to_not be_valid
    end
  end
end
