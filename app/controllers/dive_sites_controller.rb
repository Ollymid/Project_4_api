class DiveSitesController < ApplicationController
  before_action :set_dive_site, only: [:show, :update, :destroy]

  # GET /dive_sites
  def index
    @dive_sites = DiveSite.all

    render json: @dive_sites
  end

  # GET /dive_sites/1
  def show
    render json: @dive_site, include: ['users', 'logs', 'creator']
  end

  # POST /dive_sites
  def create
    @dive_site = DiveSite.new(Uploader.upload(dive_site_params))
    @dive_site.creator = current_user

    if @dive_site.save
      render json: @dive_site, status: :created, location: @dive_site
    else
      render json: @dive_site.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dive_sites/1
  def update
    if @dive_site.update(Uploader.upload(dive_site_params))
      render json: @dive_site
    else
      render json: @dive_site.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dive_sites/1
  def destroy
    @dive_site.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dive_site
      @dive_site = DiveSite.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dive_site_params
      params.permit(:name, :base64, :water_type, :dive_type, :lat, :lng, :country, :max_depth)
    end
end
