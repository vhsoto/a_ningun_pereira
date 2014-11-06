class UserPolicy < ApplicationPolicy

  def update?
    user.present? && record == user 
  end
end