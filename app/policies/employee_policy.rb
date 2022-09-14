class EmployeePolicy < ApplicationPolicy
    class Scope < Scope
        def resolve
            scope.all
        end
    end
    def index?
        @employee.employee_type?
    end
    def edit?
        update?
    end
    def update?
        @employee.employee_type? 
    end
    def show?
        true
    end
    

end
