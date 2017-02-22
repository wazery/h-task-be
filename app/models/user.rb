class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validations
  validates_presence_of :email

  # Relations
  has_many :articles

  # Methods
  def user_name
    # TODO: Does the anonymous can be changed to the email?
    name.present? ? name : 'Anonymous'
  end
end
