require 'rails_helper'

RSpec.describe SubscribersController, type: :controller do
  let(:default_headers) do
    {
      'Content-Type' => 'application/json',
      'Accept'       => 'application/json'
    }
  end

  let(:subscriber) { create(:subscriber) }

  context '#index' do
    it 'should return success' do
      request.headers.merge!(default_headers)

      get :index
      expect(response).to be_successful
    end
  end

  context '#show' do
    it 'should return success' do
      request.headers.merge!(default_headers)

      get :show, params: { id: subscriber.id }
      expect(response).to be_successful
    end
  end

  context '#create' do
    let(:params) {
      {
        subscriber: {
          name: 'example name',
          email: 'example@text.com',
        }
    }}

    it 'should return success' do
      request.headers.merge!(default_headers)

      expect { post :create, params: params }
        .to change { Subscriber.count }.by (1)
      expect(response).to be_successful
    end
  end

  context '#update' do
    let(:params) {{
      subscriber: {
        id: subscriber.id,
        is_active: false
      }
    }}

    it 'should return success' do
      request.headers.merge!(default_headers)

      expect { patch :update, params: params.merge(id: subscriber.id) }
        .to change { subscriber.reload.is_active }.from(true)
        .to(false)
      expect(response).to be_successful
    end
  end

  context '#destroy' do
    let(:params) {
      {
        id: subscriber.id,
      }
    }

    it 'should return success' do
      request.headers.merge!(default_headers)

      expect { delete :destroy, params: params }
        .to change { Subscriber.count }.by (0)
      expect(response).to be_successful
    end
  end
end
