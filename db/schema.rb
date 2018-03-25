# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180323142532) do

  create_table "monthly_reports", force: :cascade do |t|
    t.string "client"
    t.integer "paid"
    t.integer "unpaid"
    t.date "period"
    t.string "report_month"
    t.integer "non_deductable"
    t.integer "remaining_balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tax", default: 0
  end

  create_table "report_lines", force: :cascade do |t|
    t.string "so_num"
    t.string "client"
    t.integer "paid"
    t.integer "unpaid"
    t.integer "total_paid"
    t.integer "total_unpaid"
    t.integer "monthly_report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["monthly_report_id"], name: "index_report_lines_on_monthly_report_id"
  end

end
