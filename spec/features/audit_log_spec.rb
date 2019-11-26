require 'rails_helper'

describe "AuditLog features" do
  describe "index" do
    before do
      admin_user = FactoryGirl.create(:admin_user)
      login_as(admin_user, :scope => :user)
      FactoryGirl.create(:audit_log)
    end
    it "it has a index page that can be reached" do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it "cannot be accessed by non admin user" do
      logout(:user)
      non_admin_user = FactoryGirl.create(:user)
      login_as(non_admin_user, :scope => :user)
      visit audit_logs_path
      expect(current_path).to eq(root_path)
    end
  end


end