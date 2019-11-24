require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end
  end

  describe "validations" do
    it "can not created without first_name " do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "can not created without last_name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "can not created without phone" do
      @user.phone = nil
      expect(@user).to_not be_valid
    end

    it "require phone attr only contain integer" do
      @user.phone = "gauravshiv"
      expect(@user).to_not be_valid
    end

    it "require the phone attr to only 10 chars" do
      @user.phone = "01234567891"
      expect(@user).to_not be_valid
    end
  end

  describe "custome name method" do
    it "has a full name method that combines first name and last name" do
      expect(@user.full_name).to eql("SHIV, PATEL")
    end
  end
end
