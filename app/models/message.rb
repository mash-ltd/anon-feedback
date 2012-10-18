class Message < ActiveRecord::Base
  # Relations
  belongs_to :user
  belongs_to :project

  #Accessible table columns
  attr_accessible :content, :project_id, :sender_id, :user_id, :message_using_identity
  attr_accessor :message_using_identity

  # Validations
  validates_presence_of :user_id, :content
end