class LoanDeductionService
    def initialize(employee, salary)
        @employee = employee
        @salary = salary
    end
    
    def call
        
        @employee.loans.each do |loan|
            
            updated_installments_remaining = loan.installments - loan.installments_paid
            updated_installment_amount = loan.total_amount / loan.installments
            updated_amount_remaining = loan.total_amount - (loan.installment_amount * loan.installments_paid)
            loan.update(installments_remaining: updated_installments_remaining, installment_amount: updated_installment_amount)
            loan.update(amount_remaining: updated_amount_remaining)
            
            updated_total_salary = @salary.totalsalary - loan.installment_amount
            @salary.update(totalsalary: updated_total_salary)
        end

    end


end