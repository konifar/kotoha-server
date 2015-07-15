require 'rails_helper'

describe 'PhrasesController', type: :request do
  describe 'GET /api/phrases.json' do
    let(:text){ 'well' }
    let(:page){ 1 }
    let!(:phrase){ Phrase.create 'Well done sir!' }
    let(:path){ "/api/phrases.json" }
    let(:params){ { page: page, text: text } }

    context 'when page param is nothing' do
      let(:params){ { text: text } }
      it 'should be success' do
        get path, params
        expect(response).to be_success
      end
    end

  end
end