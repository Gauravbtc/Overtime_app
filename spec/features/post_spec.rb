require 'rails_helper'

describe 'navigate' do
  let(:user) {FactoryGirl.create(:user) }
  let(:post) do
    Post.create(date: Date.today, rational: "rational", user_id: user.id, overtime_request: 3.5)
  end

  before do
    login_as(user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end
    it "can be reached successfully" do
      expect(page.status_code).to eq(200)
    end

    it "has title of post" do
      expect(page).to have_content(/Posts/)
    end

    it "has list of posts" do
      post1 = FactoryGirl.build_stubbed(:post)
      post2 = FactoryGirl.build_stubbed(:secound_post)
      visit posts_path
      #expect(page).to have_content(/testing|Some rational/)
    end

    it "has a scope so that post creator can see their posts" do
      other_user = User.create(first_name: "shiv", last_name: "Patel",
                               email: "rhh@yopmail.com",password: "123456",
                               password_confirmation: "123456", phone: "555555555")
      post_from_other_user = Post.create(date: Date.today, rational: "user can't see this post", user_id: other_user.id,overtime_request: 3.5)
      visit posts_path
      expect(page).to_not have_content(/user can't see this post/)
    end
  end

  describe "creation" do
    before do
      visit new_post_path
    end

    it "has a new form that can be reached" do
      expect(page.status_code).to eq(200)
    end

    it "can be created from new form page" do
      fill_in 'post[date]' , with: Date.today
      fill_in 'post[rational]', with: "Some rational"
      fill_in 'post[overtime_request]', with: 4.5
      expect{click_on 'Save'}.to change(Post, :count).by(1)
    end

    it "will have a user associated it" do
      fill_in 'post[date]' , with: Date.today
      fill_in 'post[rational]', with: "User Association"
      fill_in 'post[overtime_request]', with: 4.5
      click_on "Save"
      expect(user.posts.last.rational).to have_content("User Association")
    end
  end

  describe 'new' do
    it "has a link from home page" do
      visit root_path
      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'edit' do
    it "can be edited" do
      visit edit_post_path(post)
      fill_in 'post[date]' , with: Date.today
      fill_in 'post[rational]', with: "Edit post"
      click_on 'Save'
      expect(page).to have_content("Edit post")
    end

    it "can not be edited by non autorized user" do
      logout(user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_authorized_user, :scope => :user)
      visit edit_post_path(post)
      expect(current_path).to eq(root_path)
    end
  end

  describe 'delete' do
    it "can be deleted" do
      logout(:user)
      delete_post_user = FactoryGirl.create(:user)
      login_as(delete_post_user, :scope => :user)
      delete_post = Post.create(date: Date.today, rational: "ad",
       user_id: delete_post_user.id, overtime_request: 3.5)
      visit posts_path
      click_link("delete_post_#{delete_post.id}")
      expect(page.status_code).to eq(200)
    end
  end
end