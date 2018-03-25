class MonthlyReportsController < ApplicationController
  before_action :set_monthly_report, only: [:show, :edit, :update, :destroy]

  # 自訂 layout
  layout 'monthly_report_layout', only: [:show]

  # GET /monthly_reports
  # GET /monthly_reports.json
  def index
    @monthly_reports = MonthlyReport.all
  end

  # GET /monthly_reports/1
  # GET /monthly_reports/1.json
  def show
    @report_lines = @monthly_report.report_lines
  end

  # GET /monthly_reports/new
  def new
    @monthly_report = MonthlyReport.new
  end

  # GET /monthly_reports/1/edit
  def edit
  end

  # POST /monthly_reports
  # POST /monthly_reports.json
  def create
    @monthly_report = MonthlyReport.new(monthly_report_params)

    respond_to do |format|
      if @monthly_report.save
        format.html { redirect_to @monthly_report, notice: 'Monthly report was successfully created.' }
        format.json { render :show, status: :created, location: @monthly_report }
      else
        format.html { render :new }
        format.json { render json: @monthly_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monthly_reports/1
  # PATCH/PUT /monthly_reports/1.json
  def update
    respond_to do |format|
      if @monthly_report.update(monthly_report_params)
        format.html { redirect_to @monthly_report, notice: 'Monthly report was successfully updated.' }
        format.json { render :show, status: :ok, location: @monthly_report }
      else
        format.html { render :edit }
        format.json { render json: @monthly_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthly_reports/1
  # DELETE /monthly_reports/1.json
  def destroy
    @monthly_report.destroy
    respond_to do |format|
      format.html { redirect_to monthly_reports_url, notice: 'Monthly report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    begin
      # monthly_report.rb model - import method
      MonthlyReport.import(params[:file])
        redirect_to monthly_reports_path, notice: "成功"
      rescue
        redirect_to monthly_reports_path, notice: "失敗"
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_report
      @monthly_report = MonthlyReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monthly_report_params
      params.require(:monthly_report).permit(:client, :paid, :unpaid, :period, :report_month, :non_deductable, :remaining_balance)
    end
end
