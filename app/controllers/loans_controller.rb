class LoansController < ApplicationController
    before_action :set_employee
    before_action :set_loans, only: [:show, :edit, :update, :destroy]
    def index
        @loans = @employee.loans.all

    end

    def show 
    
    end

    def new
    @loan = @employee.loans.new
end

    def create
        # byebug
        # CalculateSalary.new(params).call
        @loan = @employee.loans.new(loan_params)
        if @loan.save
            redirect_to user_loans_path
        else 
            render :new
        end

end

    def edit
  
end

    def update
        if @employee.loans.update(loan_params)
            redirect_to user_loan_path(@loan.id)
        else 
            render :edit
        end
end

    def destroy
        @employee.loans.delete
        flash[:notice]= "Employee information deleted"
        redirect_to users_path
end

private
def loan_params
    
    params.require(:loan).permit(:total_amount, :loan_type, :amount_remaining, :installments, :month, :installment_amount, :installments_paid, :installments_remaining)
end
def set_employee
    @employee = Employee.find(params[:user_id])
end
def set_loans
    @loan = Loan.find(params[:id])
end
end
