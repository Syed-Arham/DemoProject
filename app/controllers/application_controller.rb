class ApplicationController < ActionController::Base
    include Pundit::Authorization
    before_action :config_params, if: :devise_controller?
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    #redirect_back(fallback_location: user_path(current_employee))
    #respond_to do |format|
    respond_to do |format|
        format.html {redirect_to user_path(current_employee) }
      end
     # format.html {redirect_to(user_path(current_employee.id), alert: "fdfsdfsdf")}
    #end
  end
    protected
    def config_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name , :DOB ,:BaseSalary, :employee_type, :admin])
    end
    def pundit_user
        current_employee
      end

end
