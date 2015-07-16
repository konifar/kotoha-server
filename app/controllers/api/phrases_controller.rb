class Api::PhrasesController < ApplicationController
  def phrase_params
    params.require(:phrase).permit(:text, :tag_list)
  end

  def index
    if params[:tag]
      @phrases = Phrase.tagged_with params['tag'], any: true, wild: true
    else
      text = params[:text] ? params[:text] : ''
      @phrases = Phrase.where('text LIKE ?', "%#{text}%").limit(20)
    end

    @phrases.order(:text).limit(20)
  end

  def create
    @phrase = Phrase.new text: params[:text]
    if params[:tag_list]
      @phrase.tag_list = params[:tag_list]
    end

    if @phrase.save
      render action: 'show'
    else
      @error_message = @phrase.errors.full_messages.to_sentence
      render template: 'api/error', status: :unprocessable_entity
    end
  end
end
