class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.employee_added.subject
  #
  def employee_added()
    @greeting = "Hi"
    mail to: "to@example.org"
  end
  def salary_added()
    pdf = WickedPdf.new.pdf_from_string(
      render_to_string(pdf:'Salary Details', template:'salaries/show.html.erb'),
    )
    attachments["salary.pdf"]=pdf
    @greeting = "Hi"
    mail to: "to@example.org"
  end
end
