class UsersController < ApplicationController
    before_action :set_employee, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_employee!
    #load_and_authorize_resource 
    # load_resource


    
    def index 
        if current_employee.admin?
            @employees = Employee.all
            authorize @employees
        else
            @employees = Employee.where(employee_type: nil)
            authorize @employees
        end
    end
    
    def show
        # authorize! :read, current_user
        # if @employee.status = "resigned" || @employee.status = "terminated"
        #     render plain: "Employee not active!!"
        # end
    end
    
    def new
        @employee = Employee.new
    end
    
    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            UserMailer.employee_added.deliver_later
            redirect_to users_path
        else 
            render :new
        end
    end
    
    def edit
            if @employee.status == "terminated" || @employee.status == "resigned"
            render plain: "Employee not active!!"
            end
            authorize @employee
    end
    
    def update
        if @employee.update(employee_params)
            authorize @employee
            flash[:notice]= "Employee information was edited"
            redirect_to users_path
        else 
            render "edit"
        end
    end
     def destroy
         @employee.delete
         flash[:notice]= "Employee information deleted"
         redirect_to users_path
    
     end
    private
    def employee_params
        params.require(:employee).permit(:email, :password, :name, :DOB, :BaseSalary, :status, :employee_type)
    end
    def set_employee
        @employee = Employee.find(params[:id])
    end
    
    end