class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :add_breadcrumb_show, only: [:show]

  # GET /tracks
  def index
    @tracks = Track.all
    respond_with(@tracks)
  end

  # GET /tracks/1
  def show
    respond_with(@track)
  end

  # GET /tracks/new
  def new
    @track = Track.new
    respond_with(@track)
  end

  # GET /tracks/1/edit
  def edit
  end

  # POST /tracks
  def create
    @track = Track.new(track_params.merge(user_id: current_user.id))

    @track.save
    respond_with(@track)
  end

  # PATCH/PUT /tracks/1
  def update
    @track.update(track_params)
    respond_with(@track)
  end

  # DELETE /tracks/1
  def destroy
    @track.destroy
    respond_with(@track)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def track_params
      if current_user.is_admin?
        params.require(:track).permit(:name, :description, :date, :user_id, :creator)
      else
        params.require(:track).permit(:name, :description, :date, :creator)
      end
    end
end
