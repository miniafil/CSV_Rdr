json.extract! monthly_report, :id, :client, :paid, :unpaid, :period, :report_month, :non_deductable, :remaining_balance, :created_at, :updated_at
json.url monthly_report_url(monthly_report, format: :json)
