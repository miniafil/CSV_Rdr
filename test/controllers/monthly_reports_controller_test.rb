require 'test_helper'

class MonthlyReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monthly_report = monthly_reports(:one)
  end

  test "should get index" do
    get monthly_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_monthly_report_url
    assert_response :success
  end

  test "should create monthly_report" do
    assert_difference('MonthlyReport.count') do
      post monthly_reports_url, params: { monthly_report: { client: @monthly_report.client, non_deductable: @monthly_report.non_deductable, paid: @monthly_report.paid, period: @monthly_report.period, remaining_balance: @monthly_report.remaining_balance, report_month: @monthly_report.report_month, unpaid: @monthly_report.unpaid } }
    end

    assert_redirected_to monthly_report_url(MonthlyReport.last)
  end

  test "should show monthly_report" do
    get monthly_report_url(@monthly_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_monthly_report_url(@monthly_report)
    assert_response :success
  end

  test "should update monthly_report" do
    patch monthly_report_url(@monthly_report), params: { monthly_report: { client: @monthly_report.client, non_deductable: @monthly_report.non_deductable, paid: @monthly_report.paid, period: @monthly_report.period, remaining_balance: @monthly_report.remaining_balance, report_month: @monthly_report.report_month, unpaid: @monthly_report.unpaid } }
    assert_redirected_to monthly_report_url(@monthly_report)
  end

  test "should destroy monthly_report" do
    assert_difference('MonthlyReport.count', -1) do
      delete monthly_report_url(@monthly_report)
    end

    assert_redirected_to monthly_reports_url
  end
end
