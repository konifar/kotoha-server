require 'rails_helper'

describe 'PhrasesController', type: :request do
  describe 'GET /api/phrases.json' do
    let!(:phrase) do
      phrase = Phrase.new text: 'Well done sir!'
      phrase.tag_list = 'lgtm'
      phrase.save
      phrase
    end
    let(:path){ "/api/phrases.json" }

    before do
      get path, params
    end

    context 'when text param is given' do
      let(:params){ { text: 'well' } }
      it 'should be success' do
        expect(response).to be_success
      end

      it 'returns array of phrases' do
        json = JSON.parse response.body
        expect(json.first["id"]).to eq phrase.id
        expect(json.first["text"]).to eq phrase.text
      end

      context 'when passed text is not contained in phrase' do
        let(:params){ { tag: 'bad' } }
        it 'returns empty array' do
          json = JSON.parse response.body
          expect(json).to be_empty
        end
      end
    end

    context 'when tag param is given' do
      let(:params){ { tag: 'lg' } }
      it 'should be success' do
        expect(response).to be_success
      end
      it 'returns array of phrases' do
        json = JSON.parse response.body
        expect(json.first["id"]).to eq phrase.id
        expect(json.first["text"]).to eq phrase.text
      end

      context 'when passed tag is not contained in phrase' do
        let(:params){ { tag: 'lttm' } }
        it 'returns empty array' do
          json = JSON.parse response.body
          expect(json).to be_empty
        end
      end
    end
  end
end