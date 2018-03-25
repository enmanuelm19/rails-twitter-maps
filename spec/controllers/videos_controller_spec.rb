require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  let(:video) { FactoryBot.create(:video) }

  describe "GET index" do
    it "should get all videos" do
      get :index
      FactoryBot.create_list(:video, 3)
      expect(assigns(:videos)).to match_array(Video.all)
    end
  end

  describe "GET show" do
    it "should get specific video" do
      get :show, id: video.to_param
      expect(assigns(:video)).to eq video
    end
  end

  describe "POST create" do
    it "should create a new video" do
      video_attributes = FactoryBot.attributes_for(:video)
      expect { post :create,
                 video: video_attributes
               }.to change(Video, :count).by(1)
    end

    it "should not create a new video" do
      video_attributes = FactoryBot.attributes_for(:invalid_video)
      post :create, video: video_attributes
      expect(response).to render_template(:new)
    end
  end

  describe "PUT update" do
    it "should update the video" do
      put :update, id: video.to_param, video: { title: 'Title' }
      expect(response).to redirect_to(video)
    end

    it "should not update the video" do
      put :update, id: video.to_param, video: { title: nil }
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE destroy" do
    it "should destroy the video" do
      delete :destroy, id: video.to_param
      expect(response).to redirect_to(videos_url) 
    end
  end
end
