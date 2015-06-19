require 'rails_helper'

RSpec.describe Should, type: :model do
  before :each do
    @should = Should.create(user: 'mike', context: 'some should usage')
  end

  describe '#user' do
    it 'returns the correct "user" value from the model' do
      expect(@should.user).to eq 'mike'
    end
  end

  describe '#context' do
    it 'returns the correct "context" value from the model' do
      expect(@should.context).to eq 'some should usage'
    end
  end
end
