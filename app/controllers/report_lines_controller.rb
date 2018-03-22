class ReportLinesController < ApplicationController
  before_action :set_report_line, only: [:show, :edit, :update, :destroy]

  # GET /report_lines
  # GET /report_lines.json
  def index
    @report_lines = ReportLine.all
  end

  # GET /report_lines/1
  # GET /report_lines/1.json
  def show
  end

  # GET /report_lines/new
  def new
    @report_line = ReportLine.new
  end

  # GET /report_lines/1/edit
  def edit
  end

  # POST /report_lines
  # POST /report_lines.json
  def create
    @report_line = ReportLine.new(report_line_params)

    respond_to do |format|
      if @report_line.save
        format.html { redirect_to @report_line, notice: 'Report line was successfully created.' }
        format.json { render :show, status: :created, location: @report_line }
      else
        format.html { render :new }
        format.json { render json: @report_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /report_lines/1
  # PATCH/PUT /report_lines/1.json
  def update
    respond_to do |format|
      if @report_line.update(report_line_params)
        format.html { redirect_to @report_line, notice: 'Report line was successfully updated.' }
        format.json { render :show, status: :ok, location: @report_line }
      else
        format.html { render :edit }
        format.json { render json: @report_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_lines/1
  # DELETE /report_lines/1.json
  def destroy
    @report_line.destroy
    respond_to do |format|
      format.html { redirect_to report_lines_url, notice: 'Report line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report_line
      @report_line = ReportLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_line_params
      params.require(:report_line).permit(:so_num, :client, :paid, :unpaid, :total_paid, :total_unpaid, :monthly_report_id)
    end
end
