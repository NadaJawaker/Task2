class SubmissionRunsController < ApplicationController
  before_action :set_submission_run, only: [:show, :edit, :update, :destroy]

  # GET /submission_runs
  # GET /submission_runs.json
  def index
    @submission_runs = SubmissionRun.all
  end

  # GET /submission_runs/1
  # GET /submission_runs/1.json
  def show
    @submission_run = SubmissionRun.find(params[:id])
  end

  # GET /submission_runs/new
  def new
    @submission_run = SubmissionRun.new
  end

  # GET /submission_runs/1/edit
  def edit
  end

  # POST /submission_runs
  # POST /submission_runs.json
  def create
    @submission_run = SubmissionRun.new(submission_run_params)

    respond_to do |format|
      if @submission_run.save
        format.html { redirect_to @submission_run, notice: 'Submission run was successfully created.' }
        format.json { render :show, status: :created, location: @submission_run }
      else
        format.html { render :new }
        format.json { render json: @submission_run.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submission_runs/1
  # PATCH/PUT /submission_runs/1.json
  def update
    respond_to do |format|
      if @submission_run.update(submission_run_params)
        format.html { redirect_to @submission_run, notice: 'Submission run was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission_run }
      else
        format.html { render :edit }
        format.json { render json: @submission_run.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submission_runs/1
  # DELETE /submission_runs/1.json
  def destroy
    @submission_run.destroy
    respond_to do |format|
      format.html { redirect_to submission_runs_url, notice: 'Submission run was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission_run
      @submission_run = SubmissionRun.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def submission_run_params
      params.require(:submission_run).permit(:input, :output)
    end
end
