# Article mode
class Article < ActiveRecord::Base
  # Sort Order
  default_scope { order(created_at: :desc) }

  # Relations
  belongs_to :user

  # Validations
  validates :title, :description, presence: true
end
