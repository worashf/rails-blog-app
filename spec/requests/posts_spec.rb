require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:example) { get '/users/1/posts' }
    it 'Should respond 200 status ' do
      expect(response).to have_http_status(:ok)
    end
    it 'Should render posts of single user' do
      expect(response).to render_template(:index)
    end
    it 'Should display the correct content' do
      expect(response.body).to include('Posts')
    end
  end

  describe 'GET #show' do
    before(:example) { get '/users/1/posts/1' }

    it 'Should respond 200 status' do
      expect(response).to have_http_status(:ok)
    end
    it 'Should  render the detail of the single post' do
      expect(response).to render_template(:show)
    end

    it 'Should display the correct content' do
      expect(response.body).to include('Post details')
    end
  end
end
