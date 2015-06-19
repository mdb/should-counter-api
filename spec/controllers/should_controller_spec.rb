require 'rails_helper'

RSpec.describe ShouldsController, type: :controller do
  include AuthHelper

  before do
    http_login

    Should.new(user: 'user', context: 'context').save
  end

  describe '#index' do
    before do
      get :index
    end

    it 'returns success' do
      expect(response).to be_success
    end

    it 'returns a JSON array of all the Shoulds' do
      expect(JSON.parse(response.body)[0]['user']).to eq 'user'
      expect(JSON.parse(response.body)[0]['context']).to eq 'context'
    end
  end

  describe '#show' do
    before do
      get :show, id: 1
    end

    it 'returns success' do
      expect(response).to be_success
    end

    it 'shows the correct Should instance' do
      expect(JSON.parse(response.body)['user']).to eq 'user'
      expect(JSON.parse(response.body)['context']).to eq 'context'
    end
  end

  describe '#create' do
    before do
      post :create, should: { user: 'a user', context: 'some should context' }
    end

    it 'returns success' do
      expect(response).to be_success
    end

    it 'saves the should data it is is sent' do
      expect(Should.find_by_user('a user').context).to eq 'some should context'
    end
  end
end
