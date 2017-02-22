class Tagging < ActiveRecord::Base
  # Relations
  belongs_to :tag
  belongs_to :article
  # belongs_to :taggable, polymorphic: true
end
