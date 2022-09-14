require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "employee_added" do
    mail = UserMailer.employee_added
    assert_equal "Employee added", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
