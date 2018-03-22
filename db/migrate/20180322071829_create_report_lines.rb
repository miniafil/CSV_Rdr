class CreateReportLines < ActiveRecord::Migration[5.1]
  def change
    create_table :report_lines do |t|
      t.string :so_num
      t.string :client
      t.integer :paid
      t.integer :unpaid
      t.integer :total_paid
      t.integer :total_unpaid
      t.references :monthly_report, foreign_key: true

      t.timestamps
    end
  end
end
