class Post < ActiveRecord::Base
  # Relations
  belongs_to :project
  belongs_to :user

  # Accessible table columns
  attr_accessible :content, :project_id, :user_id, :up_votes, :down_votes, :post_using_identity
  attr_accessor :post_using_identity

  # Allows voters to vote on this model
  make_voteable

  # Validations
  validates_presence_of :content
end