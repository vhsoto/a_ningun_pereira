class CommentPolicy < ApplicationPolicy
  def index? 
    true
  end
  def update?
  	true
  end
  
  def destroy?
    update?
  end
end
