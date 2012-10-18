class User < ActiveRecord::Base
  
  # Relations
  has_many :messages

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :up_votes, :down_votes
  # attr_accessible :title, :body

  # Allows this model (users) to vote on voteable models. Used by make_voteable gem
  make_voter

  # Validations
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  validates_format_of :email, with: /^[a-zA-Z0-9._%+-]+@mashsolvents.com$/
end