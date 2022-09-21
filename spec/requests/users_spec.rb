require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }
    it 'Respond to 200 status code' do
      expect(response).to have_http_status(:ok)
    end
    it 'Should render users list ' do
      expect(response).to render_template(:index)
    end
    it 'Shoould show the correct ' do
      expect(response.body).to include('Users')
    end
  end

  describe 'Get #show' do
    before(:example) { get '/users/2' }
    it 'Should respond to 200 status ' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render the user detail' do
      expect(response).to render_template(:show)
    end
    it 'should display the correct content' do
      expect(response.body).to include('User details')
    end
  end
end
