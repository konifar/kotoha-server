class Phrase < ActiveRecord::Base
  acts_as_taggable

  validates_presence_of :text
  validates :text, length: { maximum: 200 }
end
