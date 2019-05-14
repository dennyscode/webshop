require 'rails_helper'

describe ProductsController, type: :controller do
  context 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #hello' do
    it 'renders the hello template' do
      get :hello
      expect(response).to be_ok
      expect(response).to render_template('hello')
    end
  end

  context 'GET #show' do
    it 'renders the show template' do
      get :hello
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

end
