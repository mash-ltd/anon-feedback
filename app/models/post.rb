class Post < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  attr_accessible :content, :project_id, :user_id, :up_votes, :down_votes

  make_voteable
end