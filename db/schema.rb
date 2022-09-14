# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_09_13_132451) do

  create_table "additional_deductions", force: :cascade do |t|
    t.integer "loan", default: 0
    t.integer "parking", default: 0
    t.integer "penalty", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "salary_id", null: false
    t.index ["salary_id"], name: "index_additional_deductions_on_salary_id"
  end

  create_table "additional_earnings", force: :cascade do |t|
    t.integer "bonus", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "salary_id", null: false
    t.integer "hours", default: 0
    t.integer "fixed_bonus", default: 0
    t.integer "other_bonus", default: 0
    t.index ["salary_id"], name: "index_additional_earnings_on_salary_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.date "DOB"
    t.integer "BaseSalary"
    t.boolean "employee_type"
    t.integer "status", default: 0
    t.boolean "admin"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "loan_entries", force: :cascade do |t|
    t.integer "amount"
    t.string "loan_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "loans", force: :cascade do |t|
    t.integer "amount"
    t.string "loan_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "employee_id", null: false
    t.integer "total_amount"
    t.integer "amount_remaining"
    t.integer "installments"
    t.string "month"
    t.integer "installment_amount"
    t.integer "installments_paid", default: 0
    t.integer "installments_remaining"
    t.index ["employee_id"], name: "index_loans_on_employee_id"
  end

  create_table "salaries", force: :cascade do |t|
    t.string "month"
    t.integer "year"
    t.integer "totalsalary"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "employee_id", null: false
    t.string "comments"
    t.index ["employee_id"], name: "index_salaries_on_employee_id"
  end

  add_foreign_key "additional_deductions", "salaries"
  add_foreign_key "additional_earnings", "salaries"
  add_foreign_key "loans", "employees"
  add_foreign_key "salaries", "employees"
end
