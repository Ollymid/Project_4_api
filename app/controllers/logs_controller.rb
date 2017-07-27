class LogsController < ApplicationController
  before_action :set_log, only: [:show, :update, :destroy]

  # GET /logs
  def index
    @logs = Log.all

    render json: @logs, include: ['user', 'dive_site']
  end

  # GET /logs/1
  def show
    render json: @log, include: ['user', 'dive_site']
  end

  # POST /logs
  def create
    @log = Log.new(Uploader.upload(log_params))
    @log.user = current_user

    if @log.save
      render json: @log, status: :created, location: @log, include: ['user', 'dive_site']
    else
      render json: @log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /logs/1
  def update
    if @log.update(Uploader.upload(log_params))
      render json: @log, include: ['user', 'dive_site']
    else
      render json: @log.errors, status: :unprocessable_entity
    end
  end

  # DELETE /logs/1
  def destroy
    @log.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def log_params
      params.permit(:date, :user_id, :dive_site_id, :country, :dive_time, :gear, :comments, :visibility, :temperature, :water_type, :dive_type, :base64)
    end
end
