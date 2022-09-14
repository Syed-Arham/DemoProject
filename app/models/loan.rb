class Loan < ApplicationRecord
    before_save :compute_installments_remaining
    before_save :compute_installment_amount
    before_save :compute_amount_remaining
    belongs_to :employee
    has_many :loan_entries
    

     def compute_installment_amount
        self.installment_amount = self.total_amount / self.installments
     end
     def compute_amount_remaining
        self.amount_remaining = self.total_amount-self.installment_amount * self.installments_paid
     end
     def compute_installments_remaining
        self.installments_remaining = self.installments - self.installments_paid
     end
    
end
