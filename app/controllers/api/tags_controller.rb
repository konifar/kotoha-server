class Api::TagsController < ApplicationController
  def tag_params
    params.require(:tag).permit(:name)
  end

  def index
    @tags = ActsAsTaggableOn::Tag.where('name LIKE ?', "%#{params['q']}%").limit(10)
  end
end
