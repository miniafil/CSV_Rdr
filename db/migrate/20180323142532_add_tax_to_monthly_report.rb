class AddTaxToMonthlyReport < ActiveRecord::Migration[5.1]
  def change
    add_column :monthly_reports, :tax, :integer, default: 0
  end
end
