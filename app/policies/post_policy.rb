 class PostPolicy < ApplicationPolicy
    class Scope < Scope
       def resolve
        if user.admin? || user.moderator?
            scope.all
        elsif user.present?
            scope.where(user_id: user.id) 
        else
            scope.none
        end

        end
    def index?
        true
    end
 end