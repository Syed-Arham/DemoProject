class SalariesController < ApplicationController
    before_action :set_employee
    before_action :set_salaries, only: [:show, :destroy]
    def index
        @salaries = @employee.salaries.all

    end

    def show 
    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "Salary Details", template:"salaries/.html.erb"
        end
    end
    end

    def new
    @salary = @employee.salaries.new
    @salary.build_additional_earning
    @salary.build_additional_deduction
    end

    def create
        byebug
        @salary = @employee.salaries.new(salary_params)
        if @salary.save
            # UserMailer.salary_added.deliver_later
            LoanDeductionService.new(@employee, @salary).call
            redirect_to user_salaries_path
        else 
            render :new
        end

    end

#     def edit
  
# end

#     def update
#         if @employee.salaries.update(salary_params)
#             redirect_to user_salary_path(@salary.id)
#         else 
#             render :edit
#         end
# end

#     def destroy
#         @employee.salaries.delete
#         flash[:notice]= "Employee information deleted"
#         redirect_to users_path
# end

private
def salary_params
    params.require(:salary).permit(:month, :year, :totalsalary, :date, :comments, :employee_id, additional_earning_attributes: [:bonus, :hours, :fixed_bonus, :other_bonus, :salary_id], additional_deduction_attributes: [:loan, :parking, :penalty, :salary_id])
end
def set_employee
    
    @employee = Employee.find(params[:user_id])
end
def set_salaries
    @salary = Salary.find(params[:id])
end
end

