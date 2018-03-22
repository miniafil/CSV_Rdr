json.extract! report_line, :id, :so_num, :client, :paid, :unpaid, :total_paid, :total_unpaid, :monthly_report_id, :created_at, :updated_at
json.url report_line_url(report_line, format: :json)
