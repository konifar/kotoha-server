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

  describe 'POST /api/phrases.json' do
    let(:path){ "/api/phrases.json" }

    before do
      post path, params
    end

    context 'when text param is not given' do
      let(:text){ 'Well done sir!' }
      let(:params){ {} }

      it 'should be failed' do
        expect(response).not_to be_success
      end

      it 'returns a error json' do
        json = JSON.parse response.body
        expect(json["error_message"]).to be_present
      end
    end

    context 'when tag_list param is not given' do
      let(:text){ 'Well done sir!' }
      let(:params){ { text: text } }

      it 'should be success' do
        expect(response).to be_success
      end

      it 'returns a phrases' do
        json = JSON.parse response.body
        expect(json["id"]).to be_present
        expect(json["text"]).to eq text
      end
    end

    context 'when tag_list param is given' do
      let(:text){ 'Well done sir!' }
      let(:params){ { text: text, tag_list: 'lgtm, code' } }

      it 'should be success' do
        expect(response).to be_success
      end

      it 'returns a phrases' do
        json = JSON.parse response.body
        expect(json["id"]).to be_present
      end

      it 'save phrase with tag' do
        expect(Phrase.where(text: text).first.tag_list).to eq ['lgtm', 'code']
      end
    end
  end
end