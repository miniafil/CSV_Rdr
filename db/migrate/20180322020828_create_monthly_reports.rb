class CreateMonthlyReports < ActiveRecord::Migration[5.1]
  def change
    create_table :monthly_reports do |t|
      t.string :client
      t.integer :paid
      t.integer :unpaid
      t.date :period
      t.string :report_month
      t.integer :non_deductable
      t.integer :remaining_balance

      t.timestamps
    end
  end
end
