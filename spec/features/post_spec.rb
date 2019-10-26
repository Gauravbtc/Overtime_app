require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
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
      expect(page).to have_content(/testing|Some rational/)
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
      click_on 'Save'
      expect(page).to have_content("Some rational")
    end

    it "will have a user associated it" do
      fill_in 'post[date]' , with: Date.today
      fill_in 'post[rational]', with: "User Association"
      click_on "Save"
      expect(User.last.posts.last.rational).to have_content("User Association")
    end
  end
  describe 'edit' do
    before do
      @post = FactoryGirl.create(:post)
    end
    it "can be reached by clicking on edit on index page" do
      visit posts_path
      click_link("edit_#{@post.id}")
      expect(page.status_code).to eq(200)
    end

    it "can be edited" do
      visit edit_post_path(@post)
      fill_in 'post[date]' , with: Date.today
      fill_in 'post[rational]', with: "Edit post"
      click_on 'Save'
      expect(page).to have_content("Edit post")
    end
  end
end