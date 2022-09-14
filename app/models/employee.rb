class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  enum status: [:active, :terminated, :resigned] # {active: 0, .....}
  validates :name , format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  has_many :salaries
  has_many :loans
  # validates :BaseSalary, length: {maximum: 7, message:"Invalid salary amount"}
end
