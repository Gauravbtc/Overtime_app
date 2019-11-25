require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  before do
    @audit_log = FactoryGirl.create(:audit_log)
  end

  describe "creation" do
    it "can be properly created" do
      expect(@audit_log).to be_valid
    end
  end

  describe "validation" do
    it "should have user associated" do
      @audit_log.user_id = nil
      expect(@audit_log).to_not be_valid
    end

    it "should be required status" do
      @audit_log.status = nil
      expect(@audit_log).to_not be_valid
    end

    it "should be require start_date" do
      @audit_log.start_date = nil
      expect(@audit_log).to_not be_valid
    end

    it "should be have start_date prior to 6 days" do
      @audit_log = AuditLog.create(user_id: User.last.id)
      expect(@audit_log.start_date).to eq(Date.today - 6.days )
    end
  end


end

