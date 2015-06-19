require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include AuthHelper

  before do
    http_login

    Should.new(user: 'user', context: 'context').save
  end

  describe '#show' do
    before do
      get :show, user: 'user'
    end

    it 'returns success' do
      expect(response).to be_success
    end

    it 'shows the correct Should instances associated with the provided user' do
      expect(JSON.parse(response.body)[0]['user']).to eq 'user'
      expect(JSON.parse(response.body)[0]['context']).to eq 'context'
    end

    context 'when there are multiple Should instances associated with the user' do
      before do
        Should.new(user: 'user', context: 'more context').save

        get :show, user: 'user'
      end

      it 'finds them all' do
        expect(JSON.parse(response.body).length).to eq 2
      end
    end
  end
end
