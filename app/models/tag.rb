class Tag < ActiveRecord::Base
  # Relations
  has_many :taggings
  has_many :articles, through: :taggings
end
