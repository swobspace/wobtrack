require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe TrackpointsController, type: :controller do
  login_admin

  let(:track) { FactoryGirl.create(:track) }

  # This should return the minimal set of attributes required to create a valid
  # Trackpoint. As you add validations to Trackpoint, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:trackpoint, track_id: track.id)
  }

  let(:invalid_attributes) {
    { latitude: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TrackpointsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all trackpoints as @trackpoints" do
      trackpoint = Trackpoint.create! valid_attributes
      get :index, {track_id: track.to_param}, valid_session
      expect(assigns(:trackpoints)).to eq([trackpoint])
    end
  end

  describe "GET #show" do
    it "assigns the requested trackpoint as @trackpoint" do
      trackpoint = Trackpoint.create! valid_attributes
      get :show, {track_id: track.to_param, :id => trackpoint.to_param}, valid_session
      expect(assigns(:trackpoint)).to eq(trackpoint)
    end
  end

  describe "GET #new" do
    it "assigns a new trackpoint as @trackpoint" do
      get :new, {track_id: track.to_param}, valid_session
      expect(assigns(:trackpoint)).to be_a_new(Trackpoint)
    end
  end

  describe "GET #edit" do
    it "assigns the requested trackpoint as @trackpoint" do
      trackpoint = Trackpoint.create! valid_attributes
      get :edit, {track_id: track.to_param, :id => trackpoint.to_param}, valid_session
      expect(assigns(:trackpoint)).to eq(trackpoint)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Trackpoint" do
        expect {
          post :create, {track_id: track.to_param, :trackpoint => valid_attributes}, valid_session
        }.to change(Trackpoint, :count).by(1)
      end

      it "assigns a newly created trackpoint as @trackpoint" do
        post :create, {track_id: track.to_param, :trackpoint => valid_attributes}, valid_session
        expect(assigns(:trackpoint)).to be_a(Trackpoint)
        expect(assigns(:trackpoint)).to be_persisted
      end

      it "redirects to the created trackpoint" do
        post :create, {track_id: track.to_param, :trackpoint => valid_attributes}, valid_session
        expect(response).to redirect_to([track, Trackpoint.last])
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved trackpoint as @trackpoint" do
        post :create, {track_id: track.to_param, :trackpoint => invalid_attributes}, valid_session
        expect(assigns(:trackpoint)).to be_a_new(Trackpoint)
      end

      it "re-renders the 'new' template" do
        post :create, {track_id: track.to_param, :trackpoint => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested trackpoint" do
        trackpoint = Trackpoint.create! valid_attributes
        put :update, {track_id: track.to_param, :id => trackpoint.to_param, :trackpoint => new_attributes}, valid_session
        trackpoint.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested trackpoint as @trackpoint" do
        trackpoint = Trackpoint.create! valid_attributes
        put :update, {track_id: track.to_param, :id => trackpoint.to_param, :trackpoint => valid_attributes}, valid_session
        expect(assigns(:trackpoint)).to eq(trackpoint)
      end

      it "redirects to the trackpoint" do
        trackpoint = Trackpoint.create! valid_attributes
        put :update, {track_id: track.to_param, :id => trackpoint.to_param, :trackpoint => valid_attributes}, valid_session
        expect(response).to redirect_to([track, trackpoint])
      end
    end

    context "with invalid params" do
      it "assigns the trackpoint as @trackpoint" do
        trackpoint = Trackpoint.create! valid_attributes
        put :update, {track_id: track.to_param, :id => trackpoint.to_param, :trackpoint => invalid_attributes}, valid_session
        expect(assigns(:trackpoint)).to eq(trackpoint)
      end

      it "re-renders the 'edit' template" do
        trackpoint = Trackpoint.create! valid_attributes
        put :update, {track_id: track.to_param, :id => trackpoint.to_param, :trackpoint => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested trackpoint" do
      trackpoint = Trackpoint.create! valid_attributes
      expect {
        delete :destroy, {track_id: track.to_param, :id => trackpoint.to_param}, valid_session
      }.to change(Trackpoint, :count).by(-1)
    end

    it "redirects to the trackpoints list" do
      trackpoint = Trackpoint.create! valid_attributes
      delete :destroy, {track_id: track.to_param, :id => trackpoint.to_param}, valid_session
      expect(response).to redirect_to(track_trackpoints_url(track))
    end
  end

end
