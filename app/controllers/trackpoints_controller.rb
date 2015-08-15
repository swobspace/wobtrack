class TrackpointsController < ApplicationController
  before_action :set_trackpoint, only: [:show, :edit, :update, :destroy]
  before_action :add_breadcrumb_show, only: [:show]

  # GET /trackpoints
  def index
    @trackpoints = Trackpoint.all
    respond_with(@trackpoints)
  end

  # GET /trackpoints/1
  def show
    respond_with(@trackpoint)
  end

  # GET /trackpoints/new
  def new
    @trackpoint = Trackpoint.new
    respond_with(@trackpoint)
  end

  # GET /trackpoints/1/edit
  def edit
  end

  # POST /trackpoints
  def create
    @trackpoint = Trackpoint.new(trackpoint_params)

    @trackpoint.save
    respond_with(@trackpoint)
  end

  # PATCH/PUT /trackpoints/1
  def update
    @trackpoint.update(trackpoint_params)
    respond_with(@trackpoint)
  end

  # DELETE /trackpoints/1
  def destroy
    @trackpoint.destroy
    respond_with(@trackpoint)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trackpoint
      @trackpoint = Trackpoint.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trackpoint_params
      params.require(:trackpoint).permit(:longitude, :latitude, :elevation{8,2}, :time, :track_id, :heart_rate)
    end
end
