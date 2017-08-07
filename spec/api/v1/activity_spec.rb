require 'rails_helper'
RSpec.describe Api::V1::Activity, type: :request do
  context 'GET /v1/activities/:id' do
    it 'should return 200 and activity based on given id' do
      a = create(:activity, title: "My Activity")
      get "/api/v1/activities/#{a.id}"
      expect(response.status).to eq(200)
      result = JSON.parse(response.body)
      expect(result["activity"]["id"]).to eq(a.id)
      expect(result["activity"]["title"]).to eq(a.title)
    end
  end
  context "POST /v1/activities" do
    it "should return 201 and create a new activity based on given params" do
      activity_attr = {
        title: "My Activity"
      }
      post '/api/v1/activities', params: {activity: activity_attr}
      expect(response.status).to eq(201)
      expect(Activity.all.count).to eq(1)
    end
  end
end
