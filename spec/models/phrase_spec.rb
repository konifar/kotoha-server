require 'rails_helper'

RSpec.describe Phrase, type: :model do
  describe '#create' do
    let(:text){ (0...text_length).map { ('a'..'z').to_a[rand(26)] }.join }
    subject{ Phrase.create text: text }

    context 'when text length is 201' do
      let(:text_length){ 201 }
      specify{ expect{ subject }.not_to change(Phrase, :count).from(0) }
    end
    context 'when text length is 200' do
      let(:text_length){ 200 }
      specify{ expect{ subject }.to change(Phrase, :count).from(0).to(1) }
    end
    context 'when text length is 199' do
      let(:text_length){ 199 }
      specify{ expect{ subject }.to change(Phrase, :count).from(0).to(1) }
    end
  end

  describe '.tag_list' do
    subject do
      phrase = Phrase.new text: 'Well done sir!'
      phrase.tag_list = 'lgtm'
      phrase.save
      phrase
    end
    specify{ expect(subject.tag_list).to eq ['lgtm'] }
    specify{ expect{ subject }.to change(ActsAsTaggableOn::Tag, :count).from(0).to(1) }
  end
end
