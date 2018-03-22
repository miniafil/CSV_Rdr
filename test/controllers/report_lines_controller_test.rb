require 'test_helper'

class ReportLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report_line = report_lines(:one)
  end

  test "should get index" do
    get report_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_report_line_url
    assert_response :success
  end

  test "should create report_line" do
    assert_difference('ReportLine.count') do
      post report_lines_url, params: { report_line: { client: @report_line.client, monthly_report_id: @report_line.monthly_report_id, paid: @report_line.paid, so_num: @report_line.so_num, total_paid: @report_line.total_paid, total_unpaid: @report_line.total_unpaid, unpaid: @report_line.unpaid } }
    end

    assert_redirected_to report_line_url(ReportLine.last)
  end

  test "should show report_line" do
    get report_line_url(@report_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_report_line_url(@report_line)
    assert_response :success
  end

  test "should update report_line" do
    patch report_line_url(@report_line), params: { report_line: { client: @report_line.client, monthly_report_id: @report_line.monthly_report_id, paid: @report_line.paid, so_num: @report_line.so_num, total_paid: @report_line.total_paid, total_unpaid: @report_line.total_unpaid, unpaid: @report_line.unpaid } }
    assert_redirected_to report_line_url(@report_line)
  end

  test "should destroy report_line" do
    assert_difference('ReportLine.count', -1) do
      delete report_line_url(@report_line)
    end

    assert_redirected_to report_lines_url
  end
end
