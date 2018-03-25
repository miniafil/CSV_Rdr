class MonthlyReport < ApplicationRecord
  has_many :report_lines

  require 'roo'
  require 'csv'

  def self.import(file)
      spreadsheet = Roo::Spreadsheet.open(file.path, :extension => 'xls')

      # puts " #### spreadsheet info" + spreadsheet.info
      # puts " - - - - - - - - - - - - "
      # puts " 以下是 spreadsheet.sheets"
      # puts spreadsheet.sheets
      # puts " - - - - - - - - - - - - "
      # puts "第一行：" + spreadsheet.first_row
      # puts "最後一行：" + spreadsheet.last_row
      # puts "結束"

      # client
      client = spreadsheet.cell(2, 'A')
      # paid
      paid = spreadsheet.cell(spreadsheet.last_row(spreadsheet.sheets[0]), "A").to_i
      # unpaid
      unpaid = spreadsheet.cell(spreadsheet.last_row(spreadsheet.sheets[0]), "B").to_i

      t = MonthlyReport.create( :client => client,
                              :paid => paid,
                              :unpaid => unpaid,
                              :period => Date.today,
                              :report_month => "＿月"
                              )

      (3..(spreadsheet.last_row - 2)).each do |i|
        line = t.report_lines.build
        line.so_num = spreadsheet.cell(i, 'A')
        line.client = spreadsheet.cell(i, 'B')
        paid = spreadsheet.cell(i, 'E')
        line.paid = paid.gsub(/\D/, "").to_i
        unpaid = spreadsheet.cell(i, 'F')
        line.unpaid = unpaid.gsub(/\D/, "").to_i
        line.save
      end
      puts "end of loop - - - - - "
      #puts @ary.to_json
      t.save
  end

end
