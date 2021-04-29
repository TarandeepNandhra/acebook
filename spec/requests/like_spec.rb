require 'rails_helper'

RSpec.describe 'Likes API', type: :request do

  let!(:users) { create_list(:user, 10) }
  let!(:posts) { create_list(:post, 10) }
  let!(:like) { create_list(:like, 1) }
  let(:like_id) { like.first.id }

  describe 'GET/likes' do
    before { get '/likes'}

    it 'returns likes' do
      expect(json).not_to be_empty
      expect(json.size).to eq 1
    end
    it 'returns status code 200' do
      expect(response).to have_http_status 200
    end
  end

  describe 'GET/likes/:id' do
    before { get "/likes/#{like_id}" }

    context 'when the like exists' do
      it 'returns the like' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(like_id)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status 200
      end
    end

    context 'when the like does not exist' do
      let(:like_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Like with 'id'=100/)
      end
    end
  end

  describe 'POST/likes' do
    let(:valid_attributes) { {post_id: "2", user_id: '1'} }

    context 'when the request is valid' do
      before { post '/likes', params: valid_attributes }

      it 'creates a like' do
        expect(json['post_id']).to eq(2)
        expect(json['user_id']).to eq(1)
        expect(json['id']).to eq(2)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/likes', params: { post_id: '888888', user_id: '1' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        # says Post must exist
        expect(response.body).to match(/Validation failed/)
      end
    end

    context 'when a like already exists' do
      before { post "/likes", params: { post_id: '1', user_id: '1' } }

      it 'prevents a user liking the same post' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'DELETE/likes/:id' do
    context 'when the like exists' do
      before { delete "/likes/#{like_id}?user_id=1&post_id=1" }

      it 'should return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'after the like has been deleted' do
      before { delete "/likes/#{like_id}?user_id=1&post_id=1" }
      before { get "/likes/#{like_id}" }
      it 'is dropped from the table' do
        expect(response.body).to match(/Couldn't find Like with 'id'=1/)
      end
    end
  end

  describe 'GET/likes/post_id/:id' do
    before { get '/likes/post_id/1'}
    
    it 'returns json data of likes' do
      expect(json).not_to be_empty
      expect(json.length).to eq 1
    end

    it 'returns status code 200' do
      expect(response).to have_http_status 200
    end
  end
end
