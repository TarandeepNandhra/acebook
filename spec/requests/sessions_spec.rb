require 'rails_helper'

RSpec.describe 'Sessions API', type: :request do
  let(:valid_attributes) { { forename: 'Sadie', 
                                  surname: 'Smith',
                                  username: 'Ssmith',
                                  email: 'ssmith@notadomain.com',
                                  password: 'password1',
                                  profilePic: '' } }

  describe 'POST/login' do
    before { post '/users', params: valid_attributes }
                            
    context 'when the user is valid' do
      before { post '/login', params: { user:  { username: 'Ssmith', password: 'password1' } } }
      
      it 'return logged_in as true' do
        expect(json['logged_in']).to be(true)
      end

      it 'returns the user' do
        expect(json['user']['forename']).to eq('Sadie')
      end
    end

    context 'when the password is invalid' do
      before { post '/login', params: { user:  { username: 'Ssmith', password: 'wrong' } } }

      it 'returns a status code 403' do
        expect(json['status']).to eq(403)
      end

      it 'returns the message Password is incorrect' do
        expect(json['message']).to eq('Password is incorrect')
      end
    end
  end

  describe 'GET /logged_in' do
    before { post '/users', params: valid_attributes }
    before { post '/login', params: { user:  { username: 'Ssmith', password: 'password1' } } }

    # context 'if a user is logged in' do
    #   before { get '/logged_in' }

    #   it 'returns the current_user when logged in' do
    #     p json
    #     expect(json['logged_in']).to eq(true)
    #   end

    #   it 'returns the user details' do
    #     p json
    #     expect(json['user']['username']).to eq('Ssmith')
    #   end
    # end
    
    context 'when there is no user logged in' do
      before { get '/logged_in'}

      it 'return status code 401' do
        expect(json['status']).to be(401)
      end

      it 'returns logged_in as false' do
        expect(json['logged_in']).to eq(false)
      end
    end
  end

  describe 'POST /logout' do
    before { post '/login', params: { user:  { username: 'Ssmith', password: 'password1' } } }
    before { post '/logout'}

    it 'returns https status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns "logged_out" as true' do
      expect(json['logged_out']).to eq(true)
    end
  end
end

