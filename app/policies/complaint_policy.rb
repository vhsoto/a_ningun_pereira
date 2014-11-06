class ComplaintPolicy < ApplicationPolicy
  def index? 
    true
  end
  def show?
  	record.public? || ( user.present? && (record.user == user || user.admin? ))
  end
  def destroy?
    update?
  end
end
