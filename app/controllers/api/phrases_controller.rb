class Api::PhrasesController < ApplicationController
  def phrase_params
    params.require(:phrase).permit(:text, :tag_list)
  end

  def index
    page = params[:page] ? params[:page] : 1
    text = params[:text] ? params[:text] : ''
    @phrases = Phrase.where('text LIKE ?', "%#{text}%").page(page)
  end
end