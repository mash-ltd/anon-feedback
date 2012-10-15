class Post < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  attr_accessible :content, :project_id, :user_id, :up_votes, :down_votes, :post_with_identity
  attr_accessor :post_with_identity

  make_voteable
end