require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET index' do
    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end

    it 'assigns organization and pipe' do
      get :index

      expect(assigns(:organization)).to be_a_new(Organization)
      expect(assigns(:pipe)).to be_a_new(Pipe)
    end
  end

  describe 'POST fetch' do
    it 'fetch Pipefy API and populate database' do
      expect { post :fetch }.to change(Organization, :count).by(1)

      expect(response).to redirect_to(root_path)
    end
  end
end
