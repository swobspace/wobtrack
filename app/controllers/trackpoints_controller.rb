class TrackpointsController < ApplicationController
  before_action :set_trackpoint, only: [:show, :edit, :update, :destroy]
  before_action :set_track
  before_action :add_breadcrumb_show, only: [:show]

  # GET /trackpoints
  def index
    @trackpoints = Trackpoint.all
    respond_with(@track, @trackpoints)
  end

  # GET /trackpoints/1
  def show
    respond_with(@track, @trackpoint)
  end

  # GET /trackpoints/new
  def new
    @trackpoint = Trackpoint.new
    respond_with(@track, @trackpoint)
  end

  # GET /trackpoints/1/edit
  def edit
  end

  # POST /trackpoints
  def create
    @trackpoint = Trackpoint.new(trackpoint_params.merge(track_id: @track.id))

    @trackpoint.save
    respond_with(@track, @trackpoint)
  end

  # PATCH/PUT /trackpoints/1
  def update
    @trackpoint.update(trackpoint_params)
    respond_with(@track, @trackpoint)
  end

  # DELETE /trackpoints/1
  def destroy
    @trackpoint.destroy
    respond_with(@track, @trackpoint)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trackpoint
      @trackpoint = Trackpoint.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trackpoint_params
      params.require(:trackpoint).permit(:longitude, :latitude, :elevation, :time, :track_id, :heart_rate)
    end

    def set_track
      @track = Track.find(params[:track_id])
    end

    def add_breadcrumb_solo
      add_breadcrumb_for [@trackpoint.track, @trackpoint]
    end
end
