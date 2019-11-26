class AuditLogPolicy < ApplicationPolicy
  def index?
    return true if admin?
  end

  private
    def admin?
      admin_user_types.include?(user&.type)
    end
end