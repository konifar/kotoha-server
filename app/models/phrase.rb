class Phrase < ActiveRecord::Base
  acts_as_taggable

  validates :text, length: { maximum: 200 }
end
