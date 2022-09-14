class Salary < ApplicationRecord
    validates :year, :month, presence: true
    before_create :compute_bonus
    before_create :compute_salary
    belongs_to :employee
    has_one :additional_deduction, dependent: :destroy
    has_one :additional_earning, dependent: :destroy
    accepts_nested_attributes_for :additional_earning, :additional_deduction, update_only: true
    validates :year, length: {maximum:4, message: "Invalid year"}
    def compute_bonus
        hourly_pay = self.employee.BaseSalary / 30 / 8
        bonus_hourly_pay = hourly_pay * 1.5
        self.additional_earning.bonus = (self.additional_earning.hours * bonus_hourly_pay) + self.additional_earning.fixed_bonus + self.additional_earning.other_bonus
    end
    
    def compute_salary
        self.totalsalary = self.additional_earning.bonus + self.employee.BaseSalary - self.additional_deduction.parking - self.additional_deduction.penalty
    end
end
