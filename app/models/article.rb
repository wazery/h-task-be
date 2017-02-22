# Article model
class Article < ActiveRecord::Base
  # Sort Order
  default_scope { order(created_at: :desc) }

  # Relations
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  # Validations
  validates :title, :description, presence: true

  # Methods
  def self.title_like(title)
    where("lower(articles.description) LIKE ?", "%#{title.downcase}%")
  end

  def self.description_like(description)
    where("lower(articles.description) LIKE ?", "%#{description.downcase}%")
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  # FIXME:
  def self.tagged_with(name)
    tag = Tag.find_by(name: name)
    return nil unless tag

    tag.articles
  end
end
