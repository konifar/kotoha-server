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
end
