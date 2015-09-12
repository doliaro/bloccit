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

            def index?
                true
            end

            def destroy?
                user.present? && (record.user == user || user.admin? || user.moderator?)
            end
        end
    end
end