# Article mode
class Article < ActiveRecord::Base
  # Relations
  belongs_to :user

  # Validations
  validates_presence_of :title
  validates_presence_of :description
end
