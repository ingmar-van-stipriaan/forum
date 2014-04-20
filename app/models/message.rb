class Message < ActiveRecord::Base

  belongs_to :topic
  belongs_to :user

  validates :content, :presence => true, :length => { :minimum => 2, :maximum => 500 }
  
  scope :sorted, lambda { order("created_at ASC") }
end
